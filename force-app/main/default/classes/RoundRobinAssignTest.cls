@isTest
private class RoundRobinAssignTest {
    private static final String TEST_QUEUE_NAME = 'Test Lead Queue';
    
    /**
     * Test Round Robin Assign via Queue Ownership
     */
    static testMethod void testRoundRobin_QueueOwner() {
        //get round robin queue (created in setup)
        Group queue = [SELECT Id, Name FROM Group WHERE Type = 'Queue' AND Name = :TEST_QUEUE_NAME LIMIT 1][0];
        
        //generate new leads
        List<Lead> leadsToInsert = new List<Lead>();
        for(Integer i=0;i<200;i++) {
            leadsToInsert.add(new Lead(
                FirstName = 'Test', 
                LastName = 'Lead '+i, 
                Company ='Acme', 
                OwnerId = queue.Id //owner set to round robin queue
            ));
        }

        //make sure assignment rules don't interfere with test
        Database.DMLOptions options = new Database.DMLOptions();
        options.assignmentRuleHeader.useDefaultRule = false;
        Database.insert(leadsToInsert, options);

        Test.startTest();

        //test empty constructor (used by Flow)
        RoundRobinAssignInvocable.AssignmentRequest req = new RoundRobinAssignInvocable.AssignmentRequest(); 

        /**
         * Lead assignment triggered via Process Builder
         * Call manually if PB not in place for test purposes
         */
        List<RoundRobinAssignInvocable.AssignmentRequest> requests = new List<RoundRobinAssignInvocable.AssignmentRequest>();
        for (Lead l : leadsToInsert) {
            requests.add(new RoundRobinAssignInvocable.AssignmentRequest(l.Id));
        }
        RoundRobinAssignInvocable.assignRecords(requests);

        Test.stopTest();

        //verify leads were assigned evenly (no leads left with queue owner)
        System.assert([SELECT Id FROM Lead WHERE OwnerId = :queue.Id].isEmpty());
        //verify each member got equal leads
        List<RecordAssignMember__c> members = [SELECT Id, Records_Assigned__c FROM RecordAssignMember__c WHERE RecordAssignConfiguration__r.Name = :queue.Name];
        for (RecordAssignMember__c m : members) {
            System.assertEquals(leadsToInsert.size()/members.size(), m.Records_Assigned__c);
        }
    }

    /**
     * Test Round Robin Assign via explicit config (for objects Queue unsupported)
     */
    static testMethod void testRoundRobin_QueueName() {
        //get round robin queue (created in setup)
        Group queue = [SELECT Id, Name FROM Group WHERE Type = 'Queue' AND Name = :TEST_QUEUE_NAME LIMIT 1][0];
        
        //generate new accounts (object where queue cannot be owner)
        List<Account> accsToInsert = new List<Account>();
        for(Integer i=0;i<200;i++) {
            accsToInsert.add(new Account(
                Name = 'Acme #'+i
            ));
        }
        insert accsToInsert;

        Test.startTest();

        /**
         * Lead assignment triggered via Process Builder
         * Call manually if PB not in place for test purposes
         */
        List<RoundRobinAssignInvocable.AssignmentRequest> requests = new List<RoundRobinAssignInvocable.AssignmentRequest>();
        for (Account a : accsToInsert) {
            requests.add(new RoundRobinAssignInvocable.AssignmentRequest(a.Id, TEST_QUEUE_NAME));
        }
        RoundRobinAssignInvocable.assignRecords(requests);

        Test.stopTest();

        //verify each member got equal accounts
        List<RecordAssignMember__c> members = [SELECT Id, Records_Assigned__c FROM RecordAssignMember__c WHERE RecordAssignConfiguration__r.Name = :queue.Name];
        for (RecordAssignMember__c m : members) {
            System.assertEquals(accsToInsert.size()/members.size(), m.Records_Assigned__c);
        }
    }

    @TestSetup
    private static void initTestData() {
        List<User> userReps = new List<User>();
        Integer repsToCreate = 50;
        Group qGroup;
        //create setup objects
        System.runAs([SELECT Id FROM User WHERE Id = :UserInfo.getUserId()][0]) {
            UserRole userRole = new UserRole(Name='Agent Rep');
            insert userRole;

            //create users
            Id profileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'][0].Id;
            for (Integer i=0; i<repsToCreate; i++) {
                userReps.add(new User(
                    FirstName = 'Test',
                    LastName = 'Rep '+i,
                    Email = 'test_'+UserInfo.getOrganizationId()+'_'+i+'@example.com', 
                    Username = 'test_'+UserInfo.getOrganizationId()+'_'+i+'@example.com',
                    ProfileId = profileId,
                    UserRoleId = userRole.Id,
                    Alias = 'Rep'+i, 
                    Emailencodingkey='UTF-8',  
                    Languagelocalekey='en_US', 
                    Localesidkey='en_US',  
                    Timezonesidkey='America/Los_Angeles'
                ));
            }
            insert userReps;

            //create queue to attach with Round Robin Config
            qGroup = new Group(Name=TEST_QUEUE_NAME, Type='Queue');
            insert qGroup;
            QueueSobject queue = new QueueSobject(QueueId = qGroup.Id, SObjectType = 'Lead');
            insert queue;
        }


        //create round robin config
        RecordAssignConfiguration__c config = new RecordAssignConfiguration__c(Queue_Name__c = qGroup.Name);
        insert config;

        //create members for config and attach users
        List<RecordAssignMember__c> members = new List<RecordAssignMember__c>();
        for (User u : userReps) {
            members.add(new RecordAssignMember__c(
                RecordAssignConfiguration__c = config.Id,
                User__c = u.Id,
                Active__c = true
            ));
        }
        insert members;
    }
}