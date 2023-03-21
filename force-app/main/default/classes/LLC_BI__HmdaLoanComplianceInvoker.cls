/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class HmdaLoanComplianceInvoker {
    global HmdaLoanComplianceInvoker() {

    }
    @InvocableMethod(label='HMDA Loan Compliance Automation' description='Sets the default HMDA field mappings from Loan for Loan Compliance.')
    global static void invoke(List<LLC_BI.HmdaLoanComplianceInvoker.InputParams> params) {

    }
global class InputParams {
    @InvocableVariable(label='Loan Id' description='The Id of the loan for which to run the hmda mapping service.' required=true)
    global String loanId;
    global InputParams() {

    }
}
}
