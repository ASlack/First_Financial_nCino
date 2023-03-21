/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralTypesLoaderInvoker {
    global CollateralTypesLoaderInvoker() {

    }
    @InvocableMethod(label='Collateral Types Loader' description='This invocable method loads specified Collateral Types.')
    global static List<LLC_BI.CollateralTypesLoaderInvoker.OutputParams> invoke(List<LLC_BI.CollateralTypesLoaderInvokerArgDto> invokerArgs) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Collateral Types' description='The system loads Collateral Types using the given filter parameters.' required=true)
    global List<LLC_BI.CollateralTypeInvokerDto> collateralTypes;
    global OutputParams() {

    }
}
}
