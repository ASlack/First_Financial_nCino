/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class OrchestrationSchedule_v1 {
    global String correlationId;
    global SCOC.UnitOfOrchestration_v1 currentUoO;
    global List<String> errorMessages;
    global Boolean isFailState;
    global EFPIO.LoggingService_v1 loggingService;
    global SCOC.OrchestrationSchedule_v1 nextOS;
    global List<SCOC.UnitOfOrchestration_v1> orchestrationUnits;
    global SCOC.OrchestrationSchedule_v1 previousOS;
    global Boolean primaryLogUoWCreated;
    global Integer sortOrder;
    global String subType;
    global String superType;
    global EFPIO.UoWManager_v1 uowManager;
    global Integer useCaseCodeCounter;
    global Boolean useUniqueLoggers;
    global OrchestrationSchedule_v1() {

    }
    global OrchestrationSchedule_v1(List<SCOC.UnitOfOrchestration_v1> fullOverride) {

    }
    global OrchestrationSchedule_v1(List<String> fullOverride) {

    }
    global OrchestrationSchedule_v1(EFPIO.LoggingService_v1 loggingService, List<SCOC.UnitOfOrchestration_v1> fullOverride, Integer sortOrder, String superType, String subType) {

    }
    global virtual void addNextOS(SCOC.OrchestrationSchedule_v1 os) {

    }
    global virtual void cleanStateData(Map<String,Object> stateData) {

    }
    global virtual Map<String,Object> executeOrchestration(Map<String,Object> stateData) {
        return null;
    }
    global void failOSChain() {

    }
    global virtual List<String> validateOutput(Map<String,Object> stateData) {
        return null;
    }
global virtual class DefaultCommitStrategy extends EFPIO.ACommitPriorityStrategy_v1 {
    global DefaultCommitStrategy() {

    }
    global override Boolean isMustCommit(SObject obj, EFPIO.UOW_DML_ACTION action) {
        return null;
    }
}
}
