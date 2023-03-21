/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DynObj_v1 {
    global String childLookupFieldName {
        get;
    }
    global String parentLookupFieldNameOverride {
        get;
    }
    global SObject sfObject;
    global DynObj_v1(EFPIO.ILoggingProvider_v1 loggingProvider, SObject obj) {

    }
    global DynObj_v1(EFPIO.ILoggingProvider_v1 loggingProvider, SObject sfObject, String childLookupFieldName, Map<String,List<SCOC.DynObj_v1>> children) {

    }
    global virtual void Save() {

    }
    global void addMultipleChildren(List<SCOC.DynObj_v1> children) {

    }
    global void addSingleChild(SCOC.DynObj_v1 child) {

    }
    global void addSingleChild(SObject obj) {

    }
    global void addSingleChild(String type, SCOC.DynObj_v1 child) {

    }
    global List<SCOC.DynObj_v1> getChildrenByType(String type) {
        return null;
    }
    global Map<String,List<SCOC.DynObj_v1>> getFullChilrenMap() {
        return null;
    }
    global Integer getNumberOfChildren() {
        return null;
    }
    global Boolean hasChildren() {
        return null;
    }
    global Boolean hasChildrenByType(String type) {
        return null;
    }
    global Boolean hasObjectBeenSaved() {
        return null;
    }
    global void setChildLookupFieldName(String fieldName) {

    }
    global void setParentLookupFieldNameOverride(String fieldName) {

    }
}
