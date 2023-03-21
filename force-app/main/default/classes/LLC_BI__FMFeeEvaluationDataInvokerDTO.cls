/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FMFeeEvaluationDataInvokerDTO {
    @AuraEnabled
    @InvocableVariable(label='Amount' description='Currency amount to apply to fee. If attribute is left empty, then fee amount defaults to the amount specified in associated template; if fee record already exists, its fee amount stays the same.' required=false)
    global Decimal amount;
    @AuraEnabled
    @InvocableVariable(label='Context Id' description='Id of record from which service pulls fields for evaluation criteria' required=false)
    global String contextId;
    @AuraEnabled
    @InvocableVariable(label='Fee Template Identifier' description='Unique name associated with the template from which a fee is updated or created' required=true)
    global String feeTemplateIdentifier;
    @AuraEnabled
    @InvocableVariable(label='Loan Id' description='Id of loan to which a fee is associated' required=true)
    global String loanId;
    global FMFeeEvaluationDataInvokerDTO() {

    }
}
