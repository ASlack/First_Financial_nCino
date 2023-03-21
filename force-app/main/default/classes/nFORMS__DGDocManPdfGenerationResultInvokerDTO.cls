/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DGDocManPdfGenerationResultInvokerDTO {
    @AuraEnabled
    @InvocableVariable(label='Content Document Identity' description='Content document that the service generates.' required=true)
    global String contentDocumentId;
    @AuraEnabled
    @InvocableVariable(label='Content Version Identity' description='Content version that the service generates.' required=true)
    global String contentVersionId;
    @AuraEnabled
    @InvocableVariable(label='Context Identity' description='Matches context identity on request.' required=true)
    global String contextId;
    @AuraEnabled
    @InvocableVariable(label='Form Template Identity' description='Matches form template identity on request.' required=true)
    global String formTemplateId;
    @AuraEnabled
    @InvocableVariable(label='Metadata' description='Metadata that the service generates.' required=true)
    global String metadata;
    @AuraEnabled
    @InvocableVariable(label='PDF Generation Request Identity' description='Request identity that the service generates from a hash of attributes on request.' required=true)
    global String pdfGenerationRequestId;
    @AuraEnabled
    @InvocableVariable(label='Placeholder Identity' description='Placeholder that the service generates.' required=true)
    global String placeholderId;
    @AuraEnabled
    @InvocableVariable(label='Status' description='Possible values are SUCCESS and FAIL.' required=true)
    global String status;
    global DGDocManPdfGenerationResultInvokerDTO() {

    }
}
