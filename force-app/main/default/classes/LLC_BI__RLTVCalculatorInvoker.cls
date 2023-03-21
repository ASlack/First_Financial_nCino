/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class RLTVCalculatorInvoker {
    global RLTVCalculatorInvoker() {

    }
    @InvocableMethod(label='Calculate Relationship Loan To Value' description='Calculates the configured Relationship Loan To Values.')
    global static void invoke(List<LLC_BI.RLTVCalculatorInvoker.InputParams> params) {

    }
global class InputParams {
    @InvocableVariable(label='Relationship Ids' description='The Ids of relationships for which to run the calculation.' required=true)
    global List<String> relationshipIds;
    global InputParams() {

    }
}
}
