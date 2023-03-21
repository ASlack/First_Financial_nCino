/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DGDocManPdfGenerationInvokerArgDTO {
    @AuraEnabled
    @InvocableVariable(label='Network Identity' description='An identity of a network standard object. This is required if the user who executes the service has Salesforce Community License. Otherwise, it is optional.' required=false)
    global String networkId;
    @AuraEnabled
    @InvocableVariable(label='PDF Generation Requests' description='A list of requests for PDF generation. This parameter is required.' required=true)
    global List<nFORMS.DGDocManPdfGenerationRequestInvokerDTO> requests;
    global DGDocManPdfGenerationInvokerArgDTO() {

    }
}
