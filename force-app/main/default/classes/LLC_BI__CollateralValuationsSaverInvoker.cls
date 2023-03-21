/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralValuationsSaverInvoker {
    global CollateralValuationsSaverInvoker() {

    }
    @InvocableMethod(label='Collateral Valuations Saver' description='This Invocable method saves collateral valuations specified by user.')
    global static List<LLC_BI.CollateralValuationsSaverInvoker.OutputParams> invoke(List<LLC_BI.CollateralValuationsSaverInvokerArgDto> invokerArgs) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Collateral Valuations' description='Output response from Collateral Valuations Saver Service.' required=true)
    global List<LLC_BI.CollateralValuationsInvokerDto> collateralValuations;
    global OutputParams() {

    }
}
}
