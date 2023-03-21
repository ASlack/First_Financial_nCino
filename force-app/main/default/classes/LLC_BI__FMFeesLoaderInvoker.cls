/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FMFeesLoaderInvoker {
    global FMFeesLoaderInvoker() {

    }
    @InvocableMethod(label='Fee Loader' description='Loads the specified fee records.')
    global static List<LLC_BI.FMFeesLoaderInvoker.OutputParams> invoke(List<LLC_BI.FMFeesLoaderInvokerArgDto> invokerArgsDto) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable( required=false)
    global List<LLC_BI.FMFeesInvokerDto> feeInvokerDTOS;
    global OutputParams() {

    }
}
}
