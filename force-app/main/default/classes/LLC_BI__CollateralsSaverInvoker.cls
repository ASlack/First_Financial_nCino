/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralsSaverInvoker {
    global CollateralsSaverInvoker() {

    }
    @InvocableMethod(label='Collaterals Saver' description='This invocable method saves Collaterals and Collateral Associations')
    global static List<LLC_BI.CollateralsSaverInvoker.OutputParams> invoke(List<LLC_BI.CollateralsSaverInvokerArgDto> invokerArgs) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Collaterals' description='Output response from Collateral Saver Service.' required=true)
    global List<LLC_BI.CollateralInvokerDto> collaterals;
    global OutputParams() {

    }
}
}
