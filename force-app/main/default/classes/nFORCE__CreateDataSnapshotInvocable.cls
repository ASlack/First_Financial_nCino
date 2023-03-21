/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CreateDataSnapshotInvocable {
    global CreateDataSnapshotInvocable() {

    }
    @InvocableMethod
    global static List<nFORCE.CreateDataSnapshotInvocable.OutputParameters> createDataSnapshot(List<nFORCE.CreateDataSnapshotInvocable.InputParameters> requests) {
        return null;
    }
global class InputParameters {
    @InvocableVariable(label='Context Object Id' description='Id of the sObject to snapshot' required=true)
    global Id contextId;
    @InvocableVariable(label='Screen Section Id' description='Id of the Screen Section to used when capturing snapshot values' required=true)
    global Id screenSectionId;
    @InvocableVariable(label='Description' description='Text describing the business process that initiates the snapshot' required=false)
    global String snapshotDescription;
    @InvocableVariable(label='Snapshot Type' description='Case-sensitive text that describes the way the snapshot gets stored. The value defaults to Big Object, but you can change it to Attachment.' required=false)
    global String snapshotType;
    @InvocableVariable(label='Store Immediately' description='Defines if you want to store the Snapshot immediately or delayed via trigger. The value defaults to false.' required=false)
    global Boolean storeImmediately;
    global InputParameters() {

    }
}
global class OutputParameters {
    @InvocableVariable(label='Data Snapshot Id' description='Id of the created Data Snapshot record' required=false)
    global Id dataSnapshotId;
    global OutputParameters() {

    }
}
}
