/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FMFeesEvaluatorInvoker {
    global FMFeesEvaluatorInvoker() {

    }
    @InvocableMethod(label='Fee Evaluator' description='Evaluates input fees against input fee evaluation data from matrices and fee templates, and then returns updated fees and new fees')
    global static List<LLC_BI.FMFeesEvaluatorInvoker.OutputParams> invoke(List<LLC_BI.FMFeesEvaluatorInvokerArgDTO> invokerArgsDto) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable( required=false)
    global List<LLC_BI.FMFeesInvokerDto> feeInvokerDTOS;
    global OutputParams() {

    }
}
}
