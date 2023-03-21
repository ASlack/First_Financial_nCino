/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ProductCollateralTypesLoaderInvoker {
    global ProductCollateralTypesLoaderInvoker() {

    }
    @InvocableMethod(label='Product Collateral Types Loader' description='This invocable method loads specified Product Collateral Types.')
    global static List<LLC_BI.ProductCollateralTypesLoaderInvoker.OutputParams> invoke(List<LLC_BI.ProductCollateralTypesLdrInvokerArgDto> invokerArgs) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Product Collateral Types' description='The system loads Product Collateral Types using the given filter parameters.' required=true)
    global List<LLC_BI.ProductCollateralTypeInvokerDto> productCollateralTypes;
    global OutputParams() {

    }
}
}
