/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global interface IVendorProvider_v1 {
    Map<String,Map<System.Type,List<String>>> convertQuickToDTO(SCOC.CreditInteraction_v1 param0);
    List<EFPIO.DynamicInsertObject_v1> createComplexUoWs(SCOC.CreditInteraction_v1 param0, String param1);
    List<EFPIO.DynamicInsertObject_v1> createFastUoWs(SCOC.CreditInteraction_v1 param0, String param1);
    void generateCalloutSettings(SCOC.CreditInteraction_v1 param0);
    Map<String,Object> generateComplexResponseMappingInstructions(SCOC.CreditInteraction_v1 param0);
    Map<String,Object> generateFastResponseMappingInstructions(SCOC.CreditInteraction_v1 param0);
    Map<String,Object> generateRequestMappingInstructions(SCOC.CreditRequestConfiguration_v1 param0, Map<String,String> param1, SCOC__SCOCProviderSettings__c param2, SCOC.CreditInteraction_v1 param3);
    String getClassName();
    EFPIO.ILoggingProvider_v1 getLoggingProvider();
    nFORCE.ACrossPackageService getMappingService();
    String getServiceMessagesOutput(nFORCE.ACrossPackageService param0);
    Boolean getServiceSuccessState(nFORCE.ACrossPackageService param0);
    String getServiceTransfromedOutput(nFORCE.ACrossPackageService param0);
    SCOC.VendorProviderSettingEntity_v1 getSettings();
    String normalizeErrorMessage(String param0);
    void performCreditRequest(SCOC.CreditInteraction_v1 param0);
    void setLoggingProvider(EFPIO.ILoggingProvider_v1 param0);
    void setNamedCredentialOrEndpoint(String param0);
    void setResponseResourceName(String param0);
    void setServiceInputs(Map<String,Object> param0, nFORCE.ACrossPackageService param1);
    void storeRequest(EFPIO.DynamicInsertObject_v1 param0, String param1);
    void storeResponse(EFPIO.DynamicInsertObject_v1 param0, String param1);
    List<String> validateRequest(List<SCOC.CreditRequest_v1> param0);
    List<String> validateResponse(SCOC.CreditInteraction_v1 param0);
}
