/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DocManPlaceholderSearchFilter_v1 {
    @AuraEnabled
    @InvocableVariable(label='Data Type' description='Data type of the value, values supported: BOOLEAN, STRING, ID, LONG, INTEGER, DOUBLE, DECIMAL, DATETIME' required=false)
    global String dataType;
    @AuraEnabled
    @InvocableVariable(label='Key' description='API name of the SObjectField to be filtered on' required=false)
    global String key;
    @AuraEnabled
    @InvocableVariable(label='Value' description='SObjectField value to be exactly matched' required=false)
    global String value;
    global DocManPlaceholderSearchFilter_v1() {

    }
}
