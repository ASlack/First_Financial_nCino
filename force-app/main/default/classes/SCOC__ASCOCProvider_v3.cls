/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ASCOCProvider_v3 {
    global EFPIO.LoggingService_v1 loggingService;
    global Map<String,String> pluginConfiguration;
    global SCOC.VendorProviderSettingEntity_v1 providerSettings;
    global ASCOCProvider_v3() {

    }
    global virtual void captureErrorState(SCOC.OrchestrationSchedule_v1 os, String errorMessage) {

    }
    global virtual nFORCE.UnitOfWork convertXmlToSobject(dom.Document dom, nFORCE.UnitOfWork uow) {
        return null;
    }
    global virtual SCOC.OrchestrationSchedule_v1 createAsynchronousOrchestrationSchedule(Integer sortOrder) {
        return null;
    }
    global virtual SCOC.OrchestrationSchedule_v1 createOrchestrationSchedule(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> interaction) {
        return null;
    }
    global abstract Map<String,Object> createVendorRequestBody(SCOC.OrchestrationSchedule_v1 param0, EFPIO.UoWManager_v1 param1, Map<String,Object> param2);
    global abstract Map<String,Object> denormalizeToDataModel(SCOC.OrchestrationSchedule_v1 param0, EFPIO.UoWManager_v1 param1, Map<String,Object> param2);
    global virtual Map<String,Object> finalizeTransaction(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global virtual Map<String,Object> generateCalloutSettings(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global abstract String getAppPlugin();
    global abstract String getClassName();
    global virtual SObject getInteractionSObject() {
        return null;
    }
    global virtual nFORCE.UnitOfWork getInteractionUoW() {
        return null;
    }
    global virtual Map<String,Object> performCreditRequest(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global virtual EFPIO.UoWManager_v1 registerInteraction(EFPIO.UoWManager_v1 manager) {
        return null;
    }
    global virtual nFORCE.UnitOfWork setInteractionUoW(nFORCE.UnitOfWork uow) {
        return null;
    }
    global virtual void setPluginConfiguration() {

    }
    global abstract void setSettings();
    global virtual Map<String,Object> shapeServiceOutput(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global virtual Map<String,Object> storePDFAndSetViewReportUrl(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global virtual Map<String,Object> storeRequest(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global virtual Map<String,Object> storeResponse(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global virtual Map<String,Object> validateVendorInput(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global virtual Map<String,Object> validateVendorResponse(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
}
