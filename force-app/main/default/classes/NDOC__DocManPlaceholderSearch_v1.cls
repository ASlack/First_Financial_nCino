/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DocManPlaceholderSearch_v1 {
    global DocManPlaceholderSearch_v1() {

    }
    @InvocableMethod(label='Placeholder Searcher' description='The Placeholder Search returns a list of Placeholder entities that exist within nCino.')
    global static List<NDOC.DocManPlaceholderSearch_v1.OutputParam> invoke(List<NDOC.DocManPlaceholderSearch_v1.InputParam> inputs) {
        return null;
    }
global class InputParam {
    @AuraEnabled
    @InvocableVariable(label='associatedDocumentAdditionalAttributes' description='A collection of additional Associated Document attributes to be included in the return structure' required=false)
    global List<String> associatedDocumentAdditionalAttributes;
    @AuraEnabled
    @InvocableVariable(label='associatedDocumentFilterCriteria' description='A collection of items which represents a key value pair for filtering Associated Document records against.' required=false)
    global List<NDOC.DocManPlaceholderSearchFilter_v1> associatedDocumentFilterCriteria;
    @AuraEnabled
    @InvocableVariable(label='associatedDocumentVersionAdditionalAttributes' description='A collection of additional Associated Document Version attributes to be included in the return structure' required=false)
    global List<String> associatedDocumentVersionAdditionalAttributes;
    @AuraEnabled
    @InvocableVariable(label='contextIds' description='A list of DocMan supported SObject Identities for which to retrieve placeholder entity details. Note: The list must contain IDs of same Object type for a given input.' required=false)
    global List<String> contextIds;
    @AuraEnabled
    @InvocableVariable(label='filterCriteria' description='A collection of items which represents a key value pair for filtering Placeholder records against.' required=false)
    global List<NDOC.DocManPlaceholderSearchFilter_v1> filterCriteria;
    @AuraEnabled
    @InvocableVariable(label='loadWithArchivedPlaceholders' description='A boolean that determines if the return structure should contain archived placeholder records.' required=false)
    global Boolean loadWithArchivedPlaceholders;
    @AuraEnabled
    @InvocableVariable(label='loadWithDocuments' description='A boolean that determines if the return structure should contain document records.' required=false)
    global Boolean loadWithDocuments;
    @AuraEnabled
    @InvocableVariable(label='loadWithDocumentVersions' description='A boolean that determines if the return structure should contain documentVersion records.' required=false)
    global Boolean loadWithDocumentVersions;
    @AuraEnabled
    @InvocableVariable(label='loadWithLatestVersionOnly' description='A boolean that determines if the return structure should contain ONLY the latest documentVersion records.' required=false)
    global Boolean loadWithLatestVersionOnly;
    @AuraEnabled
    @InvocableVariable(label='Pagination Page Number' description='An Integer that determines which page of returned search results to display.' required=false)
    global Integer paginationPageNumber;
    @AuraEnabled
    @InvocableVariable(label='placeholderAdditionalAttributes' description='A collection of additional Placeholder attributes to be included in the return structure' required=false)
    global List<String> placeholderAdditionalAttributes;
    @AuraEnabled
    @InvocableVariable(label='placeholderIds' description='A list of Placeholder identities for which to retrieve placeholder details.' required=false)
    global List<String> placeholderIds;
    @AuraEnabled
    @InvocableVariable(label='Results Per Page' description='An Integer that determines the number of search results displayed per page.' required=false)
    global Integer resultsPerPage;
    global InputParam() {

    }
}
global class OutputParam {
    @AuraEnabled
    @InvocableVariable(label='Placeholders' description='A serialized collection of objects that represents Placeholders' required=false)
    global String placeholders;
    @AuraEnabled
    @InvocableVariable(label='PlaceholderSObjects' description='A collection of sObjects that represents Placeholders' required=false)
    global List<NDOC.PlaceholderFlowVar_v1> placeholderSObjects;
    global OutputParam() {

    }
}
}
