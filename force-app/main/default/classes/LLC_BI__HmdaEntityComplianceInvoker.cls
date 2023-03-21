/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class HmdaEntityComplianceInvoker {
    global HmdaEntityComplianceInvoker() {

    }
    @InvocableMethod(label='HMDA Entity Compliance Automation' description='Sets the configured HMDA default mappings from Entity for Entity Compliance.')
    global static void invoke(List<LLC_BI.HmdaEntityComplianceInvoker.InputParams> params) {

    }
global class InputParams {
    @InvocableVariable(label='Loan Id' description='The Id of the Loan for which to run the hmda mapping service.' required=true)
    global String loanId;
    global InputParams() {

    }
}
}
