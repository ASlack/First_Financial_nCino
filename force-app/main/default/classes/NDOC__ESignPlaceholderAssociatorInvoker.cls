/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ESignPlaceholderAssociatorInvoker {
    global ESignPlaceholderAssociatorInvoker() {

    }
    @InvocableMethod(label='Associate E-Sign Placeholders' description='Service that links new or existing placeholders to documents that will be sent for e-signature.')
    global static List<NDOC.ESignPlaceholderAssociatorInvoker.OutputParams> invoke(List<NDOC.ESignPlaceholderAssociatorInvokerArgDTO> invokerArgsDto) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Placeholders' description='A collection of objects that represent placeholders that contain documents that are ready for e-signature.' required=false)
    global List<NDOC.ESignPlaceholderInvokerDTO> placeholderDTOs;
    global OutputParams() {

    }
}
}
