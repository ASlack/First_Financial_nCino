/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CollateralLoaderInvokerArgDto {
    @InvocableVariable(label='Collateral Association Fieldset' description='A list of field sets that the system uses to return additional information from the Collateral Association object in the returning list of collateral. This is an optional field.' required=false)
    global List<String> collateralAssociationFS;
    @InvocableVariable(label='Collateral Management Fieldset' description='A list of field sets that the system uses to return additional information from the Collateral Management object in the returning list of collateral. This is an optional field.' required=false)
    global List<String> collateralManagementFS;
    @InvocableVariable(label='Collateral Management Ids' description='A list of collateral management IDs that the system uses to filter the returning list of collateral. This is an optional input.' required=false)
    global List<String> collateralManagementIds;
    @InvocableVariable(label='Collateral Type Ids' description='A list of collateral type IDs that the system uses to filter the returning list of collateral. This is an optional input.' required=false)
    global List<String> collateralTypeIds;
    @InvocableVariable(label='Relationship Ids' description='A list of relationship IDs that the system uses to filter the returning list of collateral. This is an optional input.' required=false)
    global List<String> relationshipIds;
    @InvocableVariable(label='Return All Association Records' description='This service request returns all association records for the provided collateral management records when set to true.' required=false)
    global Boolean returnAllAssociationRecords;
    @InvocableVariable(label='Subtypes' description='A list of collateral subtypes that the system uses to filter the returning list of collateral. This is an optional input.' required=false)
    global List<String> subtypes;
    @InvocableVariable(label='Types' description='A list of collateral types that the system uses to filter the returning list of collateral. This is an optional input.' required=false)
    global List<String> types;
    global CollateralLoaderInvokerArgDto() {

    }
}
