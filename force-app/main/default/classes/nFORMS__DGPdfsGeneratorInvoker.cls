/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DGPdfsGeneratorInvoker {
    global DGPdfsGeneratorInvoker() {

    }
    @InvocableMethod(label='PDF Generator' description='Generates PDFs from form templates.')
    global static List<nFORMS.DGPdfsGeneratorInvoker.OutputParams> invoke(List<nFORMS.DGPdfGenerationInvokerArgDTO> invokerArgsDto) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='PDF Generation Results' description='A collection of PDF Generation results.' required=false)
    global List<nFORMS.DGPdfGenerationResultInvokerDTO> pdfGenerationResultInvokerDTOs;
    global OutputParams() {

    }
}
}
