/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class nCinoDefaultProvider_v1 extends SCOC.LoggableBase_v1 implements SCOC.IVendorProvider_v1 {
    global String namedCredentialOrEndpoint;
    global nCinoDefaultProvider_v1() {

    }
    global virtual Map<String,Map<System.Type,List<String>>> convertQuickToDTO(SCOC.CreditInteraction_v1 ci) {
        return null;
    }
    global virtual List<EFPIO.DynamicInsertObject_v1> createComplexUoWs(SCOC.CreditInteraction_v1 ci, String response) {
        return null;
    }
    global virtual List<EFPIO.DynamicInsertObject_v1> createFastUoWs(SCOC.CreditInteraction_v1 ci, String response) {
        return null;
    }
    global virtual void generateCalloutSettings(SCOC.CreditInteraction_v1 ci) {

    }
    global virtual Map<String,Object> generateComplexResponseMappingInstructions(SCOC.CreditInteraction_v1 ci) {
        return null;
    }
    global virtual Map<String,Object> generateFastResponseMappingInstructions(SCOC.CreditInteraction_v1 ci) {
        return null;
    }
    global virtual Map<String,Object> generateRequestMappingInstructions(SCOC.CreditRequestConfiguration_v1 crc, Map<String,String> pluginConfiguration, SCOC__SCOCProviderSettings__c providerSettings, SCOC.CreditInteraction_v1 ci) {
        return null;
    }
    global override virtual String getClassName() {
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
    global virtual String getServiceTransfromedOutput(nFORCE.ACrossPackageService service) {
        return null;
    }
    global virtual SCOC.VendorProviderSettingEntity_v1 getSettings() {
        return null;
    }
    global String normalizeErrorMessage(String errorMessage) {
        return null;
    }
    global virtual void performCreditRequest(SCOC.CreditInteraction_v1 ci) {

    }
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
