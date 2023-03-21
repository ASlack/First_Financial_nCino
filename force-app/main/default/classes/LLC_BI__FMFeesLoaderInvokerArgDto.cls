/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FMFeesLoaderInvokerArgDto {
    @InvocableVariable(label='Inbound Status List' description='This optional input value contains a list of Fee statuses the admin can exclude to match the associated fees.' required=false)
    global List<String> excludedStatuses;
    @InvocableVariable(label='Inbound Fee Ids' description='This optional input value contains a list of Fee identities the admin can populate to retrieve the matching fees.' required=false)
    global List<String> feeIds;
    @InvocableVariable(label='Inbound Fields' description='This optional input value contains a list of Fee object fields the admin can populate to build the loaded Fee entities.' required=false)
    global List<String> fields;
    @InvocableVariable(label='Inbound Loan Ids' description='This optional input value contains a list of Loan identities the admin can populate to retrieve the associated fees.' required=false)
    global List<String> loanIds;
    @InvocableVariable(label='Inbound Pricing Option Ids' description='This optional input value contains a list of Pricing Option identities the admin can populate to retrieve any associated fees.' required=false)
    global List<String> pricingOptionIds;
    global FMFeesLoaderInvokerArgDto() {

    }
}
