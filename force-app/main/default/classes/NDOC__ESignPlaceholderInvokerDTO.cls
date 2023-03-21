/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ESignPlaceholderInvokerDTO implements NDOC.APersistedEntitiesTransformer.IEntityTransferable {
    @AuraEnabled
    @InvocableVariable(label='Associated Document Store' description='A related document store that the service associates with the placeholder.' required=true)
    global NDOC.AssociatedDocumentInvkrDto associatedDocument;
    @AuraEnabled
    @InvocableVariable(label='Associated Document Collection Index' description='A related document collection index the service associates with the placeholder.' required=true)
    global NDOC.DocumentCollectionIndexInvokerDto associatedDocumentCollectionIndex;
    @AuraEnabled
    @InvocableVariable(label='Key Value Pair List' description='List of pipe delimited key value pairs (ex. "key|value")' required=true)
    global List<String> attributeValuePairs;
    @AuraEnabled
    @InvocableVariable(label='Identity' description='Document Version Salesforce Id' required=false)
    global String identity;
    global ESignPlaceholderInvokerDTO() {

    }
}
