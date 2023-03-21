/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralAssociationInvokerDto extends LLC_BI.AModeledTransferableData {
    @AuraEnabled
    @InvocableVariable(label='Key Value Pair List' description='This output value contains a list of pipe delimited key value pairs (ex. "key|value")' required=false)
    global List<String> attributeValuePairs;
    @AuraEnabled
    @InvocableVariable(label='Collateral Association Identity' description='Collateral Association Salesforce Id' required=false)
    global String identity;
    global CollateralAssociationInvokerDto() {

    }
}
