/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class JXAdminConfig_v1 {
    global String inquiryParmName {
        get;
        set;
    }
    global List<Object> inquiryResult {
        get;
        set;
    }
    global Boolean isSuccessful {
        get;
        set;
    }
    global String message {
        get;
        set;
    }
    global List<JHJX.JXAdminConfig_v1.ParmOption_v1> parmOptions {
        get;
        set;
    }
    global JHJX.JXAdminConfig_v1.SearchHeader_v1 searchHeader {
        get;
        set;
    }
    global JHJX.JXAdminConfig_v1.ParmOption_v1 selectedParm {
        get;
        set;
    }
    global JXAdminConfig_v1() {

    }
global class ParmOption_v1 {
    global List<Object> currentValues {
        get;
        set;
    }
    global String fullName {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global String label {
        get;
        set;
    }
    global List<Object> recordTypeIds {
        get;
        set;
    }
    global String serializedRecordTypeIds {
        get;
        set;
    }
    global String value {
        get;
        set;
    }
    global ParmOption_v1() {

    }
    global ParmOption_v1(String value, String label) {

    }
    global ParmOption_v1(String id, String fullName, String value, String label) {

    }
}
global class SearchHeader_v1 {
    global Integer cursor {
        get;
        set;
    }
    global String exportAttachmentId {
        get;
        set;
    }
    global Integer fromRec {
        get;
    }
    global Integer maxRec {
        get;
    }
    global Boolean moreRecs {
        get;
        set;
    }
    global String searchValue {
        get;
        set;
    }
    global Integer sentRec {
        get;
        set;
    }
    global Integer toRec {
        get;
    }
    global Integer totalRec {
        get;
        set;
    }
    global String transactionLogId {
        get;
        set;
    }
    global SearchHeader_v1() {

    }
}
}
