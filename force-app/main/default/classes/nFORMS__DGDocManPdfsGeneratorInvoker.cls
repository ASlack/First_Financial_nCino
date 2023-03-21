/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DGDocManPdfsGeneratorInvoker {
    global DGDocManPdfsGeneratorInvoker() {

    }
    @InvocableMethod(label='DocMan PDF Generator' description='Generates PDFs to Document Manager from form templates.')
    global static List<nFORMS.DGDocManPdfsGeneratorInvoker.OutputParams> invoke(List<nFORMS.DGDocManPdfGenerationInvokerArgDTO> invokerArgsDto) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Document Manager PDF Generation Results' description='A list of Document Manager PDF Generation results.' required=false)
    global List<nFORMS.DGDocManPdfGenerationResultInvokerDTO> docManPdfGenerationResultInvokerDTOs;
    global OutputParams() {

    }
}
}
