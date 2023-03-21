/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FMFeeTemplatesInvokerTransformer extends LLC_BI.AFMFeeTemplatesTransformer {
    global FMFeeTemplatesInvokerTransformer() {

    }
    @InvocableMethod(label='Fee Template Transformer' description='Converts serialized fee template data, provided to the Flow, into a variable that can be used in the Flow.')
    global static List<LLC_BI.FMFeeTemplatesInvokerTransformer.OutputParams> transform(List<LLC_BI.FMFeeTemplatesInvokerTransformer.InputParams> inputParams) {
        return null;
    }
global class InputParams {
    @AuraEnabled
    @InvocableVariable(label='Fee Template representation' description='A consumable representation of a Template Record' required=false)
    global List<LLC_BI.FMFeeTemplateInvokerDTO> feeTemplateInvokerDtos;
    global InputParams() {

    }
}
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Fee Template SObject Records' description='A list of Template Record sObject records returned by the Fee Template Transformer' required=false)
    global List<LLC_BI__Template_Records__c> records;
    global OutputParams() {

    }
}
}
