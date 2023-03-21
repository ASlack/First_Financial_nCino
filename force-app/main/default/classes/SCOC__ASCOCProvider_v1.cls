/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ASCOCProvider_v1 extends SCOC.LoggableBase_v1 {
    global ASCOCProvider_v1() {

    }
    global virtual Map<String,Map<System.Type,List<String>>> convertQuickToDTO(SCOC.CreditInteraction_v1 ci) {
        return null;
    }
    global abstract List<EFPIO.DynamicInsertObject_v1> createComplexUoWs(SCOC.CreditInteraction_v1 param0, String param1);
    global abstract List<EFPIO.DynamicInsertObject_v1> createFastUoWs(SCOC.CreditInteraction_v1 param0, String param1);
    global virtual void generateCalloutSettings(SCOC.CreditInteraction_v1 ci) {

    }
    global abstract Map<String,Object> generateComplexResponseMappingInstructions(SCOC.CreditInteraction_v1 param0);
    global abstract Map<String,Object> generateFastResponseMappingInstructions(SCOC.CreditInteraction_v1 param0);
    global abstract Map<String,Object> generateRequestMappingInstructions(SCOC.CreditRequestConfiguration_v1 param0, Map<String,String> param1, SCOC__SCOCProviderSettings__c param2, SCOC.CreditInteraction_v1 param3);
    global abstract String getClassName();
    global virtual EFPIO.ILoggingProvider_v1 getLoggingProvider(EFPIO.ILoggingProvider_v1 loggingProvider) {
        return null;
    }
    global virtual nFORCE.ACrossPackageService getMappingService() {
        return null;
    }
    global virtual String getServiceMessagesOutput(nFORCE.ACrossPackageService service) {
        return null;
    }
    global virtual Boolean getServiceSuccessState(nFORCE.ACrossPackageService service) {
        return null;
    }
    global virtual String getServiceTransformedOutput(nFORCE.ACrossPackageService service) {
        return null;
    }
    global abstract SCOC.VendorProviderSettingEntity_v1 getSettings();
    global virtual String normalizeErrorMessage(String errorMessage) {
        return null;
    }
    global abstract void performCreditRequest(SCOC.CreditInteraction_v1 param0);
    global override virtual void setLoggingProvider(EFPIO.ILoggingProvider_v1 loggingProvider) {

    }
    global virtual void setNamedCredentialOrEndpoint(String namedCredentialOrEndpoint) {

    }
    global virtual void setResponseResourceName(String defaultResourceName) {

    }
    global virtual void setServiceInputs(Map<String,Object> serviceInputMap, nFORCE.ACrossPackageService service) {

    }
    global virtual void storeRequest(EFPIO.DynamicInsertObject_v1 interactionSobject, String attachmentContent) {

    }
    global virtual void storeResponse(EFPIO.DynamicInsertObject_v1 interactionSobject, String attachmentContent) {

    }
    global virtual List<String> validateRequest(List<SCOC.CreditRequest_v1> requests) {
        return null;
    }
    global virtual List<String> validateResponse(SCOC.CreditInteraction_v1 ci) {
        return null;
    }
}
