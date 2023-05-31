/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class RoundRobinAssignInvocable {
    global RoundRobinAssignInvocable() {

    }
    @InvocableMethod(label='Assign Records Round Robin' description='Perform round robin record assignment')
    global static void assignRecords(List<RecordAssign.RoundRobinAssignInvocable.AssignmentRequest> requests) {

    }
global class AssignmentRequest {
    @InvocableVariable(label='Queue Name' description='Use specific Round Robin Configuration record with matching Queue Name' required=false)
    global String queueName;
    @InvocableVariable(label='Record Id' description='Id of record to assign ownership via round robin' required=true)
    global Id recordId;
    global AssignmentRequest() {

    }
}
}
