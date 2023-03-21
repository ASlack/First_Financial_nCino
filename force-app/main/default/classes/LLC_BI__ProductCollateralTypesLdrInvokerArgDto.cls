/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ProductCollateralTypesLdrInvokerArgDto {
    @InvocableVariable(label='Inbound Automate Pledge Only' description='This optional input value contains a true/false value the administrator can populate to retrieve the matching product collateral types and set the automate pledge field set to true.' required=false)
    global Boolean automatePledgeOnly;
    @InvocableVariable(label='Inbound Collateral Type Identities' description='This optional input value contains a list of collateral type identities the administrator can populate to retrieve the matching product collateral types.' required=false)
    global List<String> collateralTypeIds;
    @InvocableVariable(label='Inbound Identities' description='This optional input value contains a list of Product Collateral Type identities an administrator can populate to retrieve the matching product collateral types.' required=false)
    global List<String> identities;
    @InvocableVariable(label='Inbound Loan to Collateral Types Map' description='This optional input value contains a single map of a Loan id to Collateral Type ids that the system represents as a map string. The pipe delimits the key and list, and the list separates each values with commas (ex. “key | value1, value2”). The administrator can populate these values to retrieve the matching product collateral types.' required=false)
    global String loanToCollateralTypesMap;
    @InvocableVariable(label='Inbound Product Collateral Type Field Sets' description='This optional input value contains a list of field sets the system uses to store additional information from the Product Collateral Type object from a returned list of product collateral types.' required=false)
    global List<String> productCollateralTypeFieldSets;
    @InvocableVariable(label='Inbound Product or Loan Identities' description='This optional input value contains a list of product or loan identities the administrator can populate to retrieve the matching product collateral types.' required=false)
    global List<String> productOrLoanIds;
    @InvocableVariable(label='Inbound Product to Collateral Types Map' description='This optional input value contains a map of Product ids to Collateral Type ids that the system lists as map strings. The pipe delimits each key and list, and the list separates each value with commas (ex. “key | value1, value2”). The administrator can populate these values to retrieve the matching product collateral types.' required=false)
    global List<String> productToCollateralTypesMap;
    global ProductCollateralTypesLdrInvokerArgDto() {

    }
}
