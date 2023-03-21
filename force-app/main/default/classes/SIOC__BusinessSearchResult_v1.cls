/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BusinessSearchResult_v1 {
    global List<SIOC.BusinessSearchResult_v1.Column> columns {
        get;
        set;
    }
    global List<Map<String,Object>> data {
        get;
        set;
    }
    global SIOC.OperationDetails_v1 details {
        get;
        set;
    }
    global List<SIOC.BusinessSearchResult_v1.Duplicate> duplicates {
        get;
        set;
    }
    global SIOC.BusinessSearchResult_v1.SearchRequestDetail searchRequestDetail {
        get;
        set;
    }
    global List<String> uniqueHashIds {
        get;
        set;
    }
    global BusinessSearchResult_v1() {

    }
global class Column {
    global String fieldName {
        get;
        set;
    }
    global Boolean isCore {
        get;
        set;
    }
    global String label {
        get;
        set;
    }
    global Integer sortOrder {
        get;
        set;
    }
    global Column() {

    }
}
global class Duplicate {
    global Id accountId {
        get;
        set;
    }
    global String accountName {
        get;
        set;
    }
    global String uniqueHash {
        get;
        set;
    }
    global Duplicate() {

    }
}
global class SearchRequestDetail {
    global String contextId {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global Boolean isSuccessful {
        get;
        set;
    }
    global String processingPackage {
        get;
        set;
    }
    global String provider {
        get;
        set;
    }
    global Datetime timeSent {
        get;
        set;
    }
    global String transactionId {
        get;
        set;
    }
    global String transactionLogId {
        get;
        set;
    }
    global SearchRequestDetail() {

    }
}
}
