/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class FMFeeTemplateInvokerDTO implements LLC_BI.APersistedEntitiesTransformer.IEntityTransferable {
    @AuraEnabled
    @InvocableVariable(label='Key Value Pair List' description='List of pipe delimited key value pairs (ex. "key|value")' required=false)
    global List<String> attributeValuePairs;
    @AuraEnabled
    @InvocableVariable(label='Identity' description='Fee Template Salesforce Id' required=false)
    global String identity;
    global FMFeeTemplateInvokerDTO() {

    }
}
