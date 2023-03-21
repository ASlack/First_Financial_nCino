/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralTypeInvokerDto extends LLC_BI.AModeledTransferableData {
    @AuraEnabled
    @InvocableVariable(label='Key Value Pair List' description='This output value contains a list of pipe delimited key value pairs (ex. "key|value").' required=false)
    global List<String> attributeValuePairs;
    @AuraEnabled
    @InvocableVariable(label='Collateral Type Identity' description='This value contains the Collateral Type’s Salesforce id.' required=false)
    global String identity;
    global CollateralTypeInvokerDto() {

    }
}
