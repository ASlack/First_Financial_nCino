/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class UnitOfOrchestration_v1 {
    global String asyncBeanName;
    global SCOC.ASCOCProvider_v3 creditProvider;
    global List<String> errorMessages;
    global Boolean executionSuccess;
    global String handlerClassName;
    global Boolean isAsync;
    global Boolean isMandatory;
    global Boolean isPostAsyncInit;
    global EFPIO.LoggingService_v1 loggingService;
    global String outputKey;
    global SCOC.UnitOfOrchestration_v1.status unitStatus;
    global Integer useCaseCode;
    global UnitOfOrchestration_v1() {

    }
    global virtual List<String> addErrorMessage(String errorMessage) {
        return null;
    }
    global virtual void captureErrorState(SCOC.OrchestrationSchedule_v1 os, String errorMessage) {

    }
    global virtual void captureExceptionState(SCOC.OrchestrationSchedule_v1 os, Exception e) {

    }
    global virtual void elictUseCaseBehaviour(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {

    }
    global virtual Map<String,Object> executeWorkSafe(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {
        return null;
    }
    global abstract Map<String,Object> executeWork(SCOC.OrchestrationSchedule_v1 param0, EFPIO.UoWManager_v1 param1, Map<String,Object> param2);
    global virtual void finalizeUoO(SCOC.OrchestrationSchedule_v1 os, EFPIO.UoWManager_v1 uowManager, Map<String,Object> stateData) {

    }
    global abstract String getClassName();
    global virtual SCOC.UnitOfOrchestration_v1 init(EFPIO.LoggingService_v1 loggingService) {
        return null;
    }
    global virtual SCOC.UnitOfOrchestration_v1 init(EFPIO.LoggingService_v1 loggingService, SCOC.ASCOCProvider_v3 creditProvider) {
        return null;
    }
    global virtual SCOC.UnitOfOrchestration_v1 init(EFPIO.LoggingService_v1 loggingService, SCOC.ASCOCProvider_v3 creditProvider, Boolean isMandatory, Boolean warningOnFail) {
        return null;
    }
    global void throwOnUseCaseCode() {

    }
    global virtual void validateWorkInput(Map<String,Object> workInput) {

    }
    global virtual void validateWorkOutput(SCOC.OrchestrationSchedule_v1 os, Map<String,Object> workOutput) {

    }
global enum status {ERROR, PROCESSING, SUCCESS, WARNING}
}
