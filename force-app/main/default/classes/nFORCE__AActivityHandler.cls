/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class AActivityHandler {
    global AActivityHandler() {

    }
    global void appendMessageToActivityExecution(String message) {

    }
    global virtual Boolean canUseQueuables() {
        return null;
    }
    global abstract void execute();
    global String getAssociatedInteractionAction() {
        return null;
    }
    global String getAssociatedInteractionContextId() {
        return null;
    }
    global String getAssociatedInteractionExternalId() {
        return null;
    }
    global virtual Map<String,Object> getBusinessActivityConfigMapData() {
        return null;
    }
    global nFORCE.BusinessActivityConfig getBusinessActivityConfiguration() {
        return null;
    }
    global String getBusinessActivityExecutionCorrelationId() {
        return null;
    }
    global virtual String getBusinessActivityExecutionData() {
        return null;
    }
    global String getBusinessActivityExecutionDescription() {
        return null;
    }
    global String getBusinessActivityExecutionExternalId() {
        return null;
    }
    global Id getBusinessActivityExecutionId() {
        return null;
    }
    global String getBusinessActivityExecutionStatus() {
        return null;
    }
    global Map<String,Map<String,nFORCE.BusinessActivityConfig>> getBusinessProcessConfiguration() {
        return null;
    }
    global abstract String getClassName();
    global virtual List<nFORCE.BusinessActivityConfig> getErrorConditionals() {
        return null;
    }
    global virtual List<nFORCE.BusinessActivityConfig> getFinalizationErrorConditionals() {
        return null;
    }
    global virtual List<nFORCE.BusinessActivityConfig> getFinalizationSuccessConditionals() {
        return null;
    }
    global virtual nFORCE.LogService getLogService() {
        return null;
    }
    global virtual List<nFORCE.BusinessActivityConfig> getSuccessConditionals() {
        return null;
    }
    global nFORCE.BusinessProcessTelemetryService getTelemetryService() {
        return null;
    }
    global virtual nFORCE.UnitOfWorkManager getUnitOfWorkManager() {
        return null;
    }
    global virtual Boolean isAsyncContext() {
        return null;
    }
    global virtual void registerSObjectForStorage(SObject objectForStorage, nFORCE.UnitOfWorkDmlAction action, Boolean ignorePermissions) {

    }
    global void setActivityExecutionMessage(String message) {

    }
    global virtual List<nFORCE.BusinessActivityConfig> setAndReturnErrorConditionals(List<nFORCE.BusinessActivityConfig> configsToSet) {
        return null;
    }
    global virtual List<nFORCE.BusinessActivityConfig> setAndReturnFinalizationErrorConditionals(List<nFORCE.BusinessActivityConfig> configsToSet) {
        return null;
    }
    global virtual List<nFORCE.BusinessActivityConfig> setAndReturnFinalizationSuccessConditionals(List<nFORCE.BusinessActivityConfig> configsToSet) {
        return null;
    }
    global virtual List<nFORCE.BusinessActivityConfig> setAndReturnSuccessConditionals(List<nFORCE.BusinessActivityConfig> configsToSet) {
        return null;
    }
    global virtual void setBusinessActivityConfigMapData(Map<String,Object> data) {

    }
    global virtual void setBusinessActivityExecutionData(String data) {

    }
    global void setError(String code, String message, String data) {

    }
    global void setExecutionAsSuccessful() {

    }
    global virtual Id setExternalProcess(Database.Batchable<sObject> instanceOfBatchable) {
        return null;
    }
    global virtual Id setExternalProcess(System.Queueable instanceOfQueueable) {
        return null;
    }
    global virtual void setHandlerTestData(Map<String,Object> testData) {

    }
    global void setInteractionMessage(String message) {

    }
    global void setInteractionStatus(String status) {

    }
    global virtual void setStateDataForBusinessActivity(String businessActivityName, Object data) {

    }
}
