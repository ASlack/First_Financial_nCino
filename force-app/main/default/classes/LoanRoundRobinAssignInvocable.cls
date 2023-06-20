/**
 * Invocable apex class for configurable round robin record assignment
 */
global without sharing class LoanRoundRobinAssignInvocable {
    
    /**
     * Bulkified round robin assignment of records driven off of Record Assignment Configurations tied to Queues
     */
    @InvocableMethod(label='Assign Loan Team Members' description='Perform round robin record assignment for Loan Team Members')
    global static void assignLoanTeam(List<AssignmentRequest> requests) {
        if (requests != null && !requests.isEmpty()) {
            //preprocessing of any members over limit
            processMemberLimits();

            //collect request info
            Set<String> queueNames = new Set<String>();
            List<Id> recordIds = new List<Id>();
            List<Id> roleIds = new List<Id>();
            Map<Id,String> recordIdQueueNameMap = new Map<Id,String>();
            Map<Id,Id> recordIdRoleIdMap = new Map<Id,Id>();
            for (AssignmentRequest r : requests) {
                recordIds.add(r.recordId);
                if (String.isNotBlank(r.queueName)) {
                    queueNames.add(r.queueName);
                    recordIdQueueNameMap.put(r.recordId, r.queueName);
                }
                if (String.isNotBlank(r.teamRole)) {
                    roleIds.add(r.teamRole);
                    recordIdQueueNameMap.put(r.recordId, r.teamRole);
                }
            }

            //determine sobject type, dynamic query record owners
            String sobjType = recordIds[0].getSObjectType().getDescribe().getName();
            List<SObject> recordsToAssign = Database.query('SELECT Id, OwnerId, Owner.Name FROM '+sobjType+' WHERE Id IN :recordIds');

            //Get available queues that could be record owner
            Map<Id,String> queueIdNameMap = new Map<Id,String>();
            for (QueueSobject queueType : [SELECT Id, QueueId, Queue.Name FROM QueueSobject WHERE SObjectType = :sobjType]) {
                queueIdNameMap.put(queueType.QueueId, queueType.Queue.Name);
            }
            //collect queue names on records with queue owner
            for (SObject r : recordsToAssign) {
                if (queueIdNameMap.containsKey((Id)r.get('OwnerId'))) {
                    queueNames.add(queueIdNameMap.get((Id)r.get('OwnerId')));
                }
            }

            //get matching round robin configs with next assignees
            List<RecordAssignConfiguration__c> rrConfigs = [
                SELECT Id, Queue_Name__c, 
                    (SELECT Id, User__c, Records_Assigned__c 
                        FROM RecordAssignMembers__r AS m
                        WHERE Active__c = true AND User__r.IsActive = true AND Under_Limit__c = true
                        ORDER BY Last_Assignment__c ASC NULLS FIRST, Records_Assigned__c ASC NULLS FIRST
                    )
                FROM RecordAssignConfiguration__c 
                WHERE Queue_Name__c IN :queueNames
            ];

            //process records with round robin configs
            if (!rrConfigs.isEmpty()) {
                //Map queue name to the config
                Map<String,RecordAssignConfiguration__c> queueNameToConfig = new Map<String,RecordAssignConfiguration__c>();
                for (RecordAssignConfiguration__c config : rrConfigs) {
                    queueNameToConfig.put(config.Queue_Name__c, config);
                }

                //run through the records and assign by config
                Map<Id, RecordAssignMember__c> userIdToMember = new Map<Id, RecordAssignMember__c>();
                List<SObject> recordsToUpdate = new List<SObject>();
                List<SObject> recordsToCreate = new List<SObject>();
                Map<String,Integer> queueNameToRouteIndex = new Map<String,Integer>();
                for (SObject record : recordsToAssign) { 
                    //determine queue name to get config
                    String queueName = ((String)record.get('OwnerId')).startsWith('00G') ? 
                                        queueIdNameMap.get((Id)record.get('OwnerId')) : 
                                        recordIdQueueNameMap.get(record.Id);
                    //validate queue name
                    if (String.isNotBlank(queueName) && queueNameToConfig.containsKey(queueName)) {
                        //get round robin assignment config
                        RecordAssignConfiguration__c config = queueNameToConfig.get(queueName);
                        //get next assignee and set as lead owner
                        if (!config.RecordAssignMembers__r.isEmpty()) {
                            //get routing index
                            Integer queueIndex = 0;
                            if (queueNameToRouteIndex.containsKey(config.Queue_Name__c)) {
                                queueIndex = queueNameToRouteIndex.get(config.Queue_Name__c);
                            }

                            //get/set Loan Team
                            LLC_BI__LoanTeam__c teamMember = new LLC_BI__LoanTeam__c();
                            RecordAssignMember__c assignee = config.RecordAssignMembers__r[Math.mod(queueIndex, config.RecordAssignMembers__r.size())];
                            teamMember.LLC_BI__Assigned_Role__c = recordIdRoleIdMap.get(record.Id);
                            teamMember.LLC_BI__User__c = assignee.User__c;
                            teamMember.LLC_BI__Loan__c = record.Id;
                            assignee.Last_Assignment__c = Datetime.now();
                            assignee.Records_Assigned__c = assignee.Records_Assigned__c == null ? 1 : assignee.Records_Assigned__c+1;
                            userIdToMember.put(assignee.User__c, assignee);
                            recordsToCreate.add(teamMember);

                            //increment routing index
                            queueNameToRouteIndex.put(config.Queue_Name__c, ++queueIndex);
                        }
                    }
                }

                //perform updates of ownership and member configs
                insert recordsToCreate;
                update userIdToMember.values();
            }
        }
    }

    /**
     * Process/Reset Member Limits
     */
    private static void processMemberLimits() {
        List<RecordAssignMember__c> membersToUpdate = new List<RecordAssignMember__c>();
        List<RecordAssignMember__c> membersToProcess = [
            SELECT Id, Limit_Frequency__c, Last_Assignment__c
            FROM RecordAssignMember__c 
            WHERE Under_Limit__c = false
        ];

        for (RecordAssignMember__c member : membersToProcess) {
            Datetime compareDate;
            switch on member.Limit_Frequency__c {
                when 'Daily' {
                    compareDate = DateTime.now().addDays(-1);
                }
                when 'Weekly' {
                    compareDate = DateTime.now().addDays(-7);
                }
                when 'Monthly' {
                    compareDate = DateTime.now().addMonths(-1);
                }
                when 'Quarterly' {
                    compareDate = DateTime.now().addMonths(-3);
                }
                when 'Annual' {
                    compareDate = DateTime.now().addYears(-1);
                }
            }
            if (compareDate != null && member.Last_Assignment__c < compareDate) {
                member.Records_Assigned__c = 0;
                membersToUpdate.add(member);
            }
        }

        update membersToUpdate;
    }

    global class AssignmentRequest {
        @InvocableVariable(label='Record Id' required=true description='Id of record to assign ownership via round robin')
        global Id recordId;

        @InvocableVariable(label='Queue Name' description='Use specific Round Robin Configuration record with matching Queue Name')
        global String queueName;
        
        @InvocableVariable(label='Team Role' description='Use Team Member Role Name')
        global Id teamRole;

        global AssignmentRequest() {}

        public AssignmentRequest(Id recordId) {
            this.recordId = recordId;
        }
        
        public AssignmentRequest(Id recordId, String queueName, Id teamRole) {
            this.recordId = recordId;
            this.queueName = queueName;
            this.teamRole = teamRole;
        }
    }
}