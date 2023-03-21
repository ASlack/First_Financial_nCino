/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ADmlHandler {
    global ADmlHandler() {

    }
    global virtual List<Database.DeleteResult> dmlDeleteWithResults(List<SObject> records, Database.DMLOptions options) {
        return null;
    }
    global abstract void dmlDelete(List<SObject> param0);
    global virtual List<Database.SaveResult> dmlInsertWithResults(List<SObject> records, Database.DMLOptions options) {
        return null;
    }
    global abstract void dmlInsert(List<SObject> param0);
    global virtual List<Database.SaveResult> dmlUpdateWithResults(List<SObject> records, Database.DMLOptions options) {
        return null;
    }
    global abstract void dmlUpdate(List<SObject> param0);
    global virtual List<Database.UpsertResult> dmlUpsertWithResults(List<SObject> records, Database.DMLOptions options) {
        return null;
    }
    global abstract void dmlUpsert(List<SObject> param0, Schema.SObjectField param1);
    global virtual void withoutSecurity() {

    }
}
