/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class UoWManager_v1 {
    global UoWManager_v1(EFPIO.LoggingService_v1 loggingService) {

    }
    global UoWManager_v1(EFPIO.LoggingService_v1 loggingService, EFPIO.ACommitPriorityStrategy_v1 commitPriorityStrategy) {

    }
    global void addManager(EFPIO.UoWManager_v1 managerToMerge) {

    }
    global void addSObjectForCommit(SObject item, EFPIO.UOW_DML_ACTION action) {

    }
    global void addSObjectForCommit(SObject item, EFPIO.UOW_DML_ACTION action, Boolean isMustCommit) {

    }
    global void commitWork() {

    }
    global void commitWork(Boolean commitNonMustCommitsUoWs) {

    }
    global static void disableDatabaseRollBack() {

    }
    global List<nFORCE.UnitOfWork> getMustCommitUoWs() {
        return null;
    }
    global List<nFORCE.UnitOfWork> getUoWs() {
        return null;
    }
    global void registerMustCommitUoW(nFORCE.UnitOfWork uow) {

    }
    global void registerMustCommitUoW(nFORCE.UnitOfWork uow, String descriptor) {

    }
    global void registerMustCommitUoW(List<nFORCE.UnitOfWork> uowList) {

    }
    global void registerMustCommitUoW(List<nFORCE.UnitOfWork> uowList, String descriptor) {

    }
    global void registerMustCommitUoW(Set<nFORCE.UnitOfWork> uowSet) {

    }
    global void registerMustCommitUoW(Set<nFORCE.UnitOfWork> uowSet, String descriptor) {

    }
    global void registerUoW(nFORCE.UnitOfWork uow) {

    }
    global void registerUoW(nFORCE.UnitOfWork uow, String descriptor) {

    }
    global void registerUoW(List<nFORCE.UnitOfWork> uowList) {

    }
    global void registerUoW(List<nFORCE.UnitOfWork> uowList, String descriptor) {

    }
    global void registerUoW(Set<nFORCE.UnitOfWork> uowSet) {

    }
    global void registerUoW(Set<nFORCE.UnitOfWork> uowSet, String descriptor) {

    }
    global void setCommitPriorityStrategy(EFPIO.ACommitPriorityStrategy_v1 commitPriorityStrategy) {

    }
    global void setLoggingService(EFPIO.LoggingService_v1 loggingService) {

    }
}
