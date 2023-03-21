/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DocumentCollectionIndexInvokerDto implements NDOC.APersistedEntitiesTransformer.IEntityTransferable {
    @AuraEnabled
    @InvocableVariable(label='Key Value Pair List' description='List of pipe delimited key value pairs (ex. "key|value")' required=false)
    global List<String> attributeValuePairs;
    @AuraEnabled
    @InvocableVariable(label='Associated Document' description='Document Associated to the Document Collection Index' required=false)
    global NDOC.AssociatedDocumentInvkrDto docStore;
    @AuraEnabled
    @InvocableVariable(label='Identity' description='Document Collection Index Salesforce Id' required=false)
    global String identity;
    global DocumentCollectionIndexInvokerDto() {

    }
}
