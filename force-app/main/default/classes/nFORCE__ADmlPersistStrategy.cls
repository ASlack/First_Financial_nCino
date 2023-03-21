/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ADmlPersistStrategy extends nFORCE.APersistenceStrategy {
    global virtual nFORCE.DmlPersistResults getPreviousDmlPersistResults() {
        return null;
    }
    global virtual nFORCE.ADmlPersistStrategy includeDmlResults() {
        return null;
    }
    global abstract void performDml();
    global virtual nFORCE.ADmlPersistStrategy setDmlOptions(Database.DMLOptions options) {
        return null;
    }
    global virtual nFORCE.ADmlPersistStrategy throwOnPersistErrors() {
        return null;
    }
global class Options {
    global Database.DMLOptions dmlOptions;
    global Boolean includeDmlResults;
    global Boolean partialSave;
    global Boolean throwOnPersistErrors;
    global Options() {

    }
}
}
