/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ABVVendorProvider_v1 {
    global SIOC.ABVVendorConfig_v1 vendorConfig;
    global ABVVendorProvider_v1() {

    }
    global virtual void addLog(String status, String details) {

    }
    global virtual void addLog(System.LoggingLevel level, String status, String details) {

    }
    global virtual void createRequest(SIOC.BVInteraction_v1 interaction) {

    }
    global virtual String getAPIInteractionFileName(SIOC.BVInteraction_v1 interaction) {
        return null;
    }
    global abstract String getClassName();
    global virtual dom.Document getInstanceFromCacheKey(String cacheKey) {
        return null;
    }
    global abstract String getInteractionType();
    global EFPIO.ILoggingProvider_v1 getLoggingProvider() {
        return null;
    }
    global virtual EFPIO.LoggingService_v1 getLoggingService() {
        return null;
    }
    global virtual String getMappingLogLevels() {
        return null;
    }
    global nFORCE.ACrossPackageService getMappingXpkg(List<MTRNS.MappingSelectorKeyModel_v1> selectorKeys, List<MTRNS.MapInstruction_v1> mapInstructions, MTRNS.MapDataSource_v1 dataSource) {
        return null;
    }
    global abstract String getPluginName();
    global virtual String getProviderLogLevels() {
        return null;
    }
    global abstract String getProviderName();
    global virtual EFPIO.UoWManager_v1 getUnitOfWorkManager() {
        return null;
    }
    global abstract SIOC.ABVVendorConfig_v1 getVendorConfig();
    global virtual SIOC.BVInteraction_v1 mutateInteractionObject(SIOC.BVInteraction_v1 interaction) {
        return null;
    }
    global virtual void parseResponse(SIOC.BVInteraction_v1 interaction) {

    }
    global virtual void performRequest(SIOC.BVInteraction_v1 interaction) {

    }
    global virtual void registerSObjectForCommit(Boolean isPriority, EFPIO.UOW_DML_ACTION action, SObject item) {

    }
    global void setLoggingProvider(EFPIO.ILoggingProvider_v1 loggingProvider) {

    }
    global virtual void setLoggingService(EFPIO.LoggingService_v1 loggingService) {

    }
    global void setUnitOfWorkManager(EFPIO.UoWManager_v1 uowManager) {

    }
    global virtual void shapeMethodOutput(SIOC.BVInteraction_v1 interaction) {

    }
    global virtual void shapePersistence(SIOC.BVInteraction_v1 interaction) {

    }
    global virtual void startMethod(String methodName) {

    }
    global virtual void stopMethod(String methodName) {

    }
    global virtual void storeRequest(nFORCE.UnitOfWork interactionUoW, SIOC.BVInteraction_v1 interaction) {

    }
    global virtual void storeResponse(nFORCE.UnitOfWork interactionUoW, SIOC.BVInteraction_v1 interaction) {

    }
    global virtual void updateDataSource(SIOC.BVInteraction_v1 interaction) {

    }
    global virtual void validateInput(SIOC.BVInteraction_v1 interaction) {

    }
    global virtual void validateResponse(SIOC.BVInteraction_v1 interaction) {

    }
}
