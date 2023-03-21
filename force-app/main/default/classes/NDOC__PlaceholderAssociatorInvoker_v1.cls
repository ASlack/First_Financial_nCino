/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PlaceholderAssociatorInvoker_v1 {
    global PlaceholderAssociatorInvoker_v1() {

    }
    @InvocableMethod(label='Associate Placeholders' description='Service that links new or existing placeholders to content.')
    global static List<NDOC.PlaceholderAssociatorInvoker_v1.OutputParam> invoke(List<NDOC.PlaceholderAssociatorInvoker_v1.InputParam> inputs) {
        return null;
    }
global class InputParam {
    @InvocableVariable(label='Add New Version' description='Flag used to determine if a new version should be added over existing versions of content' required=true)
    global Boolean addNewVersion;
    @InvocableVariable(label='Placeholders' description='Serialized collection of objects that represent placeholders' required=true)
    global String placeholders;
    global InputParam() {

    }
}
global class OutputParam {
    @AuraEnabled
    @InvocableVariable(label='Placeholder Objects' description='Collection of sObjects that represent placeholders' required=false)
    global List<NDOC.PlaceholderFlowVar_v1> placeholderObjects;
    @InvocableVariable(label='Placeholders' description='Serialized collection of objects that represent placeholders' required=false)
    global String placeholders;
    global OutputParam() {

    }
}
}
