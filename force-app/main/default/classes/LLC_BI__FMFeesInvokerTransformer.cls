/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FMFeesInvokerTransformer extends LLC_BI.AFMFeesTransformer {
    global FMFeesInvokerTransformer() {

    }
    @InvocableMethod(label='Fee Transformer' description='Converts serialized data, provided to the Flow, into a variable that can be used in the Flow.')
    global static List<LLC_BI.FMFeesInvokerTransformer.OutputParams> transform(List<LLC_BI.FMFeesInvokerTransformer.InputParams> inputParams) {
        return null;
    }
global class InputParams {
    @AuraEnabled
    @InvocableVariable(label='Fee representation' description='A consumable representation of a Fee' required=false)
    global List<LLC_BI.FMFeesInvokerDto> feeInvokerDtos;
    global InputParams() {

    }
}
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Fee SObject Records' description='A list of Fee sObject records returned by the Fee Transformer' required=false)
    global List<SObject> records;
    global OutputParams() {

    }
}
}
