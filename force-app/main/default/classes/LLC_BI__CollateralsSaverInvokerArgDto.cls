/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralsSaverInvokerArgDto {
    @AuraEnabled
    @InvocableVariable(label='Collateral Association Fieldset Name' description='The field set name for Collateral Associations for which the fields should be saved.' required=false)
    global String collateralAssociationFieldsetName;
    @AuraEnabled
    @InvocableVariable(label='Collateral Fieldset Names' description='The field set names for Collateral for which fields should be saved.' required=false)
    global List<String> collateralFieldsetNames;
    @AuraEnabled
    @InvocableVariable(label='Collaterals' description='List of collaterals active in Collateral Saver Service.' required=true)
    global List<LLC_BI.CollateralInvokerDto> collaterals;
    global CollateralsSaverInvokerArgDto() {

    }
}
