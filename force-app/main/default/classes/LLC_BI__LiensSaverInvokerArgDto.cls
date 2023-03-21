/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class LiensSaverInvokerArgDto {
    @AuraEnabled
    @InvocableVariable(label='Collateral Lien DTOs' description='This optional input is a list of liens for the LiensSaverInvokerDto object to save.' required=false)
    global List<LLC_BI.LienInvokerDto> liens;
    @InvocableVariable(label='Collateral Pledge Identities' description='This optional input is a list of PledgeIDs from which the LiensSaverInvokerDto object creates liens.' required=false)
    global List<Id> pledgeIds;
    global LiensSaverInvokerArgDto() {

    }
}
