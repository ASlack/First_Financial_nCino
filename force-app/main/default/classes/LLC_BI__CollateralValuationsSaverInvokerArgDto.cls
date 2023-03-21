/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralValuationsSaverInvokerArgDto {
    @AuraEnabled
    @InvocableVariable(label='Collateral Valuations' description='List of collateral valuations active in Collateral Valuations Saver Service.' required=true)
    global List<LLC_BI.CollateralValuationsInvokerDto> collateralValuations;
    global CollateralValuationsSaverInvokerArgDto() {

    }
}
