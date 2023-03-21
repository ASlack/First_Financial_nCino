/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SpreadsPeriodInvokerDto extends nCRED.DataTransferObject {
    @AuraEnabled
    @InvocableVariable( required=false)
    global Double averageExchangeRate;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Double exchangeRate;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Boolean isAnnual;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Boolean isCreatedByExternalSystem;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Boolean isFiscalYear;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Boolean isProjection;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Integer month;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Integer numberOfMonths;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String periodKey;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String projectedFrom;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String source;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String sourceCurrency;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String statementDate;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Integer supplementalNumberOfMonths;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String supplementalSource;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Date supplementalStatementDate;
    @AuraEnabled
    @InvocableVariable( required=false)
    global String type;
    @AuraEnabled
    @InvocableVariable( required=false)
    global Integer year;
    global SpreadsPeriodInvokerDto() {

    }
}
