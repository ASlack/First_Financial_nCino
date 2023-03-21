/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BaseRateMatrixExecutorInvoker {
    global BaseRateMatrixExecutorInvoker() {

    }
    @InvocableMethod(label='Run Base Rate Matrix' description='Use this InvocableMethod to run Matrix Execution for Base Rate Matrices')
    global static List<LLC_BI.BaseRateMatrixExecutorInvoker.OutputParams> invoke(List<LLC_BI.BaseRateMatrixExecutorInvoker.InputParams> inputParams) {
        return null;
    }
global class InputParams {
    @InvocableVariable(label='Context Id' description='Id of Context Record' required=true)
    global String contextId;
    @InvocableVariable(label='Queried Dimensions' description='List of Queried Dimensions' required=true)
    global List<LLC_BI.QueriedDimension> queriedDimensions;
    global InputParams() {

    }
}
global class OutputParams {
    @InvocableVariable(label='Reference Matrix Id' description='Results from a Matrix Execution Request' required=false)
    global String matrixId;
    @InvocableVariable(label='Matrix Execution Status Message' description='Additional information about the Status of the Matrix Execution Request' required=false)
    global String message;
    @InvocableVariable(label='Matching Offers' description='Offers generate from Base Rate Matrix results' required=false)
    global List<LLC_BI__Pricing_Option__c> pricingOptions;
    @InvocableVariable(label='Matrix Execution Status' description='Status of the Matrix Execution Request' required=false)
    global String status;
    global OutputParams() {

    }
}
}
