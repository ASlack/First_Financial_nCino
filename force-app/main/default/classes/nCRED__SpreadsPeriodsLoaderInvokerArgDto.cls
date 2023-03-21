/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SpreadsPeriodsLoaderInvokerArgDto {
    @InvocableVariable(label='contextId' description='This input value defines the relationship or collateral ID whose periods are to be listed.' required=true)
    global String contextId;
    @InvocableVariable(label='isFiscalYear' description='This input value determines whether the system searches only for periods that are fiscal years.' required=false)
    global Boolean isFiscalYear;
    @InvocableVariable(label='mostRecentFiscalYear' description='This input value determines whether the system searches only for the period with the most recent fiscal year. If set to true, all other filters will be ignored.' required=false)
    global Boolean mostRecentFiscalYear;
    @InvocableVariable(label='numberOfMonths' description='This input value determines whether the system searches only for periods with the defined number of months.' required=false)
    global Integer numberOfMonths;
    @InvocableVariable(label='source' description='This input value determines whether the system searches only for periods with the defined source.' required=false)
    global String source;
    global SpreadsPeriodsLoaderInvokerArgDto() {

    }
}
