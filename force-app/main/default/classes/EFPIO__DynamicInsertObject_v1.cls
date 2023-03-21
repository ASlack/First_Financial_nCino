/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class DynamicInsertObject_v1 extends nFORCE.UnitOfWork {
    global SObject sfObject {
        get;
        set;
    }
    global DynamicInsertObject_v1(EFPIO.ILoggingProvider_v1 loggingProvider, SObject obj) {

    }
    global DynamicInsertObject_v1(EFPIO.ILoggingProvider_v1 loggingProvider, SObject sfObject, Schema.SObjectField field) {

    }
    global virtual void DML_INSERT_MANY_USING_CHUNKING(Map<Schema.SObjectType,List<SObject>> chunksByType) {

    }
    global virtual void DML_INSERT_ONE(SObject o) {

    }
    global void addMultipleChildren(List<EFPIO.DynamicInsertObject_v1> children) {

    }
    global EFPIO.DynamicInsertObject_v1 addSingleChild(SObject obj, Schema.SObjectField lookupToParent) {
        return null;
    }
    global override void commitWork() {

    }
    global List<EFPIO.DynamicInsertObject_v1> getChildrenByType(Schema.SObjectType objType) {
        return null;
    }
    global Map<Schema.SObjectType,List<EFPIO.DynamicInsertObject_v1>> getFullChilrenMap() {
        return null;
    }
    global Integer getNumberOfChildren() {
        return null;
    }
    global Boolean hasChildren() {
        return null;
    }
    global Boolean hasChildrenByType(Schema.SObjectType objType) {
        return null;
    }
    global Boolean hasObjectBeenSaved() {
        return null;
    }
    global override void registerDirty(SObject record) {

    }
    global override void registerDirty(List<SObject> records) {

    }
    global override void registerNew(SObject record) {

    }
    global override void registerNew(List<SObject> records) {

    }
    global override void registerRelationship(SObject record, Schema.SObjectField recordField, SObject relatedTo) {

    }
    global override void registerRelationship(SObject record, Schema.SObjectField recordField, SObject relatedTo, Schema.SObjectField relatedToField) {

    }
    global override void registerRemove(SObject record) {

    }
    global override void registerRemove(List<SObject> records) {

    }
}
