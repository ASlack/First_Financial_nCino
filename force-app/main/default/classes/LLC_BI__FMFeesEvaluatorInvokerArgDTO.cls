/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FMFeesEvaluatorInvokerArgDTO {
    @AuraEnabled
    @InvocableVariable(label='Evaluation Data List' description='List of fee evaluation data transfer objects the service evaluates against fees.' required=true)
    global List<LLC_BI.FMFeeEvaluationDataInvokerDTO> evaluationDataDtos;
    @AuraEnabled
    @InvocableVariable(label='Fees' description='List of fee data transfer objects to be evaluated.' required=false)
    global List<LLC_BI.FMFeesInvokerDto> feeDtos;
    @AuraEnabled
    @InvocableVariable(label='Fee Templates' description='List of fee template data transfer objects the service evaluates against fees.' required=true)
    global List<LLC_BI.FMFeeTemplateInvokerDTO> feeTemplateDtos;
    global FMFeesEvaluatorInvokerArgDTO() {

    }
}
