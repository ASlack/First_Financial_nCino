/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DGDocManPdfGenerationRequestInvokerDTO {
    @AuraEnabled
    @InvocableVariable(label='Content Document Identity' description='The identity of a content document the services uses for form generation.' required=false)
    global String contentDocumentId;
    @AuraEnabled
    @InvocableVariable(label='Context Identity' description='An identity of a context object to use for form generation.' required=true)
    global String contextId;
    @AuraEnabled
    @InvocableVariable(label='Form Template Identity' description='The identity of a form template from which the service generates a form.' required=true)
    global String formTemplateId;
    global DGDocManPdfGenerationRequestInvokerDTO() {

    }
}
