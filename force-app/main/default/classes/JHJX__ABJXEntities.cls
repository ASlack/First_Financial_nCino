/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class ABJXEntities {
    global ABJXEntities() {

    }
global class ABCustomerCalloutInputParams {
    @InvocableVariable(label='Key Value List' description='List of pipe delimited key value pairs (ex. "key|value"). Values can ONLY be strings, not complex objects as they will not be converted.' required=false)
    global List<String> additionalProperties;
    @InvocableVariable(label='externalReferenceId' description='Is the external reference id for the log that has been created as a placeholder for the flow, leave blank if you do not require it for your flow use' required=false)
    global String externalReferenceId;
    @InvocableVariable(label='relationshipId' description='Is the Salesforce relationship id (Account Id) to be used for the context base for the customer booking.' required=true)
    global String relationshipId;
    @InvocableVariable(label='requestedByUserId' description='Is the user id requesting the log to be created - used only during the log creation.' required=false)
    global String requestedByUserId;
    @InvocableVariable(label='userSessionId' description='Is the users session id since the future callout will not have context of that through batch.' required=true)
    global String userSessionId;
    global ABCustomerCalloutInputParams() {

    }
}
global class ABDepositCalloutInputParams {
    @InvocableVariable(label='Key Value List' description='Deprecated.' required=false)
    global List<String> additionalProperties;
    @InvocableVariable(label='depositId' description='Deprecated.' required=true)
    global String depositId;
    @InvocableVariable(label='externalReferenceId' description='Deprecated.' required=false)
    global String externalReferenceId;
    @InvocableVariable(label='requestedByUserId' description='Deprecated.' required=false)
    global String requestedByUserId;
    @InvocableVariable(label='userSessionId' description='Deprecated.' required=true)
    global String userSessionId;
    global ABDepositCalloutInputParams() {

    }
}
global class ABLoanCalloutInputParams {
    @InvocableVariable(label='Key Value List' description='List of pipe delimited key value pairs (ex. "key|value"). Values can ONLY be strings, not complex objects as they will not be converted.' required=false)
    global List<String> additionalProperties;
    @InvocableVariable(label='externalReferenceId' description='Is the external reference id for the log that has been created as a placeholder for the flow, leave blank if you do not require it for your flow use' required=false)
    global String externalReferenceId;
    @InvocableVariable(label='LoanId' description='Is the Salesforce loan id to be used for the context base for the loan booking.' required=true)
    global String LoanId;
    @InvocableVariable(label='requestedByUserId' description='Is the user id requesting the log to be created - used only during the log creation.' required=false)
    global String requestedByUserId;
    @InvocableVariable(label='userSessionId' description='Is the users session id since the future callout will not have context of that through batch.' required=true)
    global String userSessionId;
    global ABLoanCalloutInputParams() {

    }
}
global class ABNonBatchCustomerCalloutInputParams {
    @InvocableVariable(label='Key Value List' description='List of pipe delimited key value pairs (ex. "key|value"). Values can ONLY be strings, not complex objects as they will not be converted.' required=false)
    global List<String> additionalProperties;
    @InvocableVariable(label='externalReferenceId' description='Is the external reference id for the log that has been created as a placeholder for the flow, leave blank if you do not require it for your flow use' required=false)
    global String externalReferenceId;
    @InvocableVariable(label='relationshipId' description='Is the Salesforce relationship id (Account Id) to be used for the context base for the customer booking.' required=true)
    global String relationshipId;
    global ABNonBatchCustomerCalloutInputParams() {

    }
}
global class ABNonBatchDepositCalloutInputParams {
    @InvocableVariable(label='Key Value List' description='Deprecated.' required=false)
    global List<String> additionalProperties;
    @InvocableVariable(label='depositId' description='Deprecated.' required=true)
    global String depositId;
    @InvocableVariable(label='externalReferenceId' description='Deprecated.' required=false)
    global String externalReferenceId;
    global ABNonBatchDepositCalloutInputParams() {

    }
}
global class ABNonBatchLoanCalloutInputParams {
    @InvocableVariable(label='Key Value List' description='List of pipe delimited key value pairs (ex. "key|value"). Values can ONLY be strings, not complex objects as they will not be converted.' required=false)
    global List<String> additionalProperties;
    @InvocableVariable(label='externalReferenceId' description='Is the external reference id for the log that has been created as a placeholder for the flow, leave blank if you do not require it for your flow use' required=false)
    global String externalReferenceId;
    @InvocableVariable(label='LoanId' description='Is the Salesforce loan id to be used for the context base for the loan booking.' required=true)
    global String LoanId;
    global ABNonBatchLoanCalloutInputParams() {

    }
}
global class ABTransactionLogInputParams {
    @InvocableVariable(label='ExternalId' description='Is external id of the transaction log to update' required=true)
    global String ExternalId;
    @InvocableVariable(label='Status' description='The Status to update the log to' required=false)
    global String Status;
    @InvocableVariable(label='TransactionDetails' description='The transaction details' required=false)
    global String TransactionDetails;
    @InvocableVariable(label='VendorStatus' description='The Vendor Status to update the log to' required=false)
    global String VendorStatus;
    global ABTransactionLogInputParams() {

    }
}
global class CompoundTransactionLogResponse {
    global String Action {
        get;
        set;
    }
    global Boolean bookCustomerButtonEnabled {
        get;
        set;
    }
    global Boolean bookDepositButtonEnabled {
        get;
        set;
    }
    global Boolean bookToCoreButtonEnabled {
        get;
        set;
    }
    global String Details {
        get;
        set;
    }
    global String ExternalId {
        get;
        set;
    }
    global Boolean IsComplete {
        get;
        set;
    }
    global Boolean IsSuccessful {
        get;
        set;
    }
    global Boolean modifyLoanButtonEnabled {
        get;
        set;
    }
    global String ObjectId {
        get;
        set;
    }
    global Boolean renewLoanButtonEnabled {
        get;
        set;
    }
    global Boolean reserveLoanButtonEnabled {
        get;
        set;
    }
    global String Status {
        get;
        set;
    }
    global String VendorStatus {
        get;
        set;
    }
    global CompoundTransactionLogResponse() {

    }
}
global class JHJXResponse {
    @InvocableVariable(label='IsSuccessful' description='Indicates if the activity was successful or not.' required=false)
    global Boolean IsSuccessful;
    @InvocableVariable(label='Messages' description='Response messages from the booking activity.' required=false)
    global String Messages;
    global String ResponseBody;
    @InvocableVariable(label='TransactionLogExternalId' description='The transaction external identifier for the activity.' required=false)
    global String TransactionLogExternalId;
    global JHJXResponse() {

    }
}
global class TransactionLogResponse {
    global String Action {
        get;
        set;
    }
    global String Details {
        get;
        set;
    }
    global String ExternalId {
        get;
        set;
    }
    global Boolean IsComplete {
        get;
        set;
    }
    global Boolean IsSuccessful {
        get;
        set;
    }
    global String ObjectId {
        get;
        set;
    }
    global String Status {
        get;
        set;
    }
    global String VendorStatus {
        get;
        set;
    }
}
}
