/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DGFormTemplatesLoaderInvoker {
    global DGFormTemplatesLoaderInvoker() {

    }
    @InvocableMethod(label='Form Template Loader' description='Loads form templates.')
    global static List<nFORMS.DGFormTemplatesLoaderInvoker.OutputParams> invoke(List<nFORMS.DGFormTemplatesLoaderArgsDTO> invokerArgsDto) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Form Templates' description='Form templates the service returns to the consumer.' required=false)
    global List<nFORMS.DGFormTemplateInvokerDTO> formTemplates;
    global OutputParams() {

    }
}
}
