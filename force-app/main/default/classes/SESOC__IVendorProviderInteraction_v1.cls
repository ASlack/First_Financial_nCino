/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global interface IVendorProviderInteraction_v1 {
    void castGenericInputToConcreteType(SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 param0);
    EFPIO.HttpCalloutUtility_v1.HttpCalloutSettings_v1 createCalloutSettings();
    String createPayload();
    SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 executeInteraction(EFPIO.ILoggingProvider_v1 param0, SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 param1, SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 param2);
    SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 getVPIInputInstanceVariable();
    String getVPIName();
    void normalizeResponse(SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 param0, EFPIO.HttpCalloutUtility_v1.HttpCalloutResponse_v1 param1);
    EFPIO.HttpCalloutUtility_v1.HttpCalloutResponse_v1 performCallout(EFPIO.HttpCalloutUtility_v1.HttpCalloutSettings_v1 param0);
}
