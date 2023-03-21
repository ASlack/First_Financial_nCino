/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ColPledgesSaverInvokerArgDto {
    @AuraEnabled
    @InvocableVariable(label='Collateral Pledged DTOs' description='This required input is a list of pledges for the CollateralPledgedInvokerDto object to save.' required=true)
    global List<LLC_BI.CollateralPledgedInvokerDto> pledges;
    global ColPledgesSaverInvokerArgDto() {

    }
}
