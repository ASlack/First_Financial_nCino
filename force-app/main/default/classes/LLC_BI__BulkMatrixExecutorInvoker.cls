/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BulkMatrixExecutorInvoker {
    global BulkMatrixExecutorInvoker() {

    }
    @InvocableMethod(label='Run Bulk Matrix Executor' description='Use this InvocableMethod to run Bulk Matrix Execution')
    global static List<LLC_BI.BulkMatrixExecutorInvoker.OutputParams> invoke(List<LLC_BI.BulkMatrixExecutorInvoker.InputParams> inputParams) {
        return null;
    }
global class InputParams {
    @InvocableVariable(label='Context Ids' description='A required input that holds the Ids of context records for the Bulk Matrix Execution' required=true)
    global List<String> contextIds;
    @InvocableVariable(label='Payload Overrides' description='An optional input that holds the payload overrides to customize Bulk Matrix Execution payload' required=false)
    global List<LLC_BI.BulkQueriedDimension> payloadOverrides;
    @InvocableVariable(label='Policy Type Features' description='Policy Type Features' required=false)
    global List<String> policyTypeFeatures;
    @InvocableVariable(label='Policy Types' description='Policy Types Lookup Keys or Record Ids' required=false)
    global List<String> policyTypes;
    global InputParams() {

    }
}
global class OutputParams {
    @InvocableVariable(label='Raw Response' description='JSON serialized Bulk Matrix Execution response' required=false)
    global String rawResponse;
    @InvocableVariable(label='Reduced Bulk Matrix Results' description='Use these Bulk Matrix Results to customize Bulk Matrix Execution response' required=false)
    global List<LLC_BI.BulkMatrixResult> reducedBulkMatrixResults;
    global OutputParams() {

    }
}
}
