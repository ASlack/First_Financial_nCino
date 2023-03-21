/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class TotalExposureInvocable {
    global TotalExposureInvocable() {

    }
    @InvocableMethod(label='Run Total Exposure' description='Run Total Exposure for a given record as a Job')
    global static void runTotalExposure(List<LLC_BI.TotalExposureInvocable.ParameterInput> requests) {

    }
global class ParameterInput {
    @InvocableVariable(label='Object Name' description='Define which Object with the following names "Loan", "Account", or "Product Package"' required=true)
    global String objName;
    @InvocableVariable(label='Record Id' description='Record Id of the Object Record to run on works with Loan, Account or Product Package' required=true)
    global String recordId;
}
}
