/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FMFeesGeneratorInvoker {
    global FMFeesGeneratorInvoker() {

    }
    @InvocableMethod(label='Fee Generator' description='Generates fees for the specified loan ids')
    global static List<LLC_BI.FMFeesGeneratorInvoker.OutputParams> invoke(List<LLC_BI.FMFeesGeneratorInvoker.InputParams> params) {
        return null;
    }
global class InputParams {
    @InvocableVariable(label='Loan IDs' description='Loan Salesforce IDs' required=true)
    global List<String> loanIds;
    global InputParams() {

    }
}
global class OutputParams {
    @InvocableVariable(label='Fee IDs' description='Fee Salesforce IDs created or updated by the generator service' required=true)
    global List<String> feeIds;
    global OutputParams() {

    }
}
}
