/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FormSyntaxProcessorRequestInvokerDTO {
    @AuraEnabled
    @InvocableVariable(label='Context Identity' description='The context identity from which the service processes.' required=true)
    global String contextId;
    @AuraEnabled
    @InvocableVariable(label='Mask Fields' description='A boolean indicating if the service should mask fields.' required=false)
    global Boolean maskFields;
    @AuraEnabled
    @InvocableVariable(label='Unprocessed String' description='The raw string to process.' required=true)
    global String unprocessedString;
    global FormSyntaxProcessorRequestInvokerDTO() {

    }
}
