/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SpreadsBundleInvokerDto extends nCRED.DataTransferObject {
    @AuraEnabled
    @InvocableVariable( required=false)
    global String contextId;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String externalId;
    @AuraEnabled
    @InvocableVariable( required=false)
    global List<nCRED.SpreadsPeriodInvokerDto> periods;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String template;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String type;
    global SpreadsBundleInvokerDto() {

    }
}
