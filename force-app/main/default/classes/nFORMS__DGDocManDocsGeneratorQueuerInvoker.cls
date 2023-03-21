/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DGDocManDocsGeneratorQueuerInvoker {
    global DGDocManDocsGeneratorQueuerInvoker() {

    }
    @InvocableMethod(label='Queueable DocMan PDF Generator' description='Generates PDFs to Document Manager from form templates via queueable process.')
    global static List<nFORMS.DGDocManDocsGeneratorQueuerInvoker.OutputParams> invoke(List<nFORMS.DGDocManPdfGenerationInvokerArgDTO> invokerArgsDto) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Job Identities' description='A collection of apex job identities that correspond with the queued requests.' required=false)
    global List<Id> jobIds;
    global OutputParams() {

    }
}
}
