/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralTypesLoaderInvokerArgDto {
    @InvocableVariable(label='Inbound Exclude Group Types' description='This optional input value contains a true/false value the administrator populates to indicate if the system should filter out Collateral Group types.' required=false)
    global Boolean excludeGroupTypes;
    @InvocableVariable(label='Inbound Identities' description='This optional input value contains a list of Collateral Type identities an administrator populates to retrieve the matching collateral types.' required=false)
    global List<String> identities;
    @InvocableVariable(label='Inbound Include Inactive Types' description='This optional input value contains a true/false value the administrator populates to indicate if the system includes inactive collateral types in the search.' required=false)
    global Boolean includeInactiveTypes;
    @InvocableVariable(label='Inbound Is Leased Asset' description='This optional input value contains a boolean that determines if the system should filter collateral types by leased asset types.' required=false)
    global Boolean isLeasedAsset;
    @InvocableVariable(label='Inbound Loan Identity' description='This optional input value contains a loan identity the system uses to filter the returned Collateral type records by their product collateral types.' required=false)
    global String loanId;
    @InvocableVariable(label='Inbound Collateral Subtypes List' description='This optional input value contains a list of collateral subtypes the system uses to filter the returned Collateral type records.' required=false)
    global List<String> subtypes;
    @InvocableVariable(label='Inbound Collateral Types List' description='This optional input value contains a list of collateral types the system uses to filter the returned Collateral type records.' required=false)
    global List<String> types;
    global CollateralTypesLoaderInvokerArgDto() {

    }
}
