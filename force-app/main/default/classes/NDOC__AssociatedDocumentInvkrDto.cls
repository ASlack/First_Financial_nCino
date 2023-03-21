/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AssociatedDocumentInvkrDto implements NDOC.APersistedEntitiesTransformer.IEntityTransferable {
    @AuraEnabled
    @InvocableVariable(label='Key Value Pair List' description='List of pipe delimited key value pairs (ex. "key|value")' required=false)
    global List<String> attributeValuePairs;
    @AuraEnabled
    @InvocableVariable(label='Identity' description='Document Store Salesforce Id' required=false)
    global String identity;
    @AuraEnabled
    @InvocableVariable(label='Associated Document Versions' description='A collection of related document versions.' required=false)
    global List<NDOC.AssociatedDocumentVersionInvkrDto> versions;
    global AssociatedDocumentInvkrDto() {

    }
}
