/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class UnitOfWorkManager {
    global UnitOfWorkManager() {

    }
    global UnitOfWorkManager(nFORCE.ACommitPriorityStrategy commitPriorityStrategy) {

    }
    global UnitOfWorkManager(nFORCE.LogService logService) {

    }
    global UnitOfWorkManager(nFORCE.LogService logService, nFORCE.ACommitPriorityStrategy commitPriorityStrategy) {

    }
    global void addManager(nFORCE.UnitOfWorkManager managerToMerge) {

    }
    global void addSObjectForCommit(SObject item, nFORCE.UnitOfWorkDmlAction action) {

    }
    global void addSObjectForCommit(SObject item, nFORCE.UnitOfWorkDmlAction action, Boolean isMustCommit) {

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
    global Boolean hasUoWs() {
        return null;
    }
    global void registerMustCommitUoW(nFORCE.UnitOfWork uow, String descriptor) {

    }
    global void registerMustCommitUoW(List<nFORCE.UnitOfWork> uowList, String descriptor) {

    }
    global void registerMustCommitUoW(Set<nFORCE.UnitOfWork> uowSet, String descriptor) {

    }
    global void registerUoW(nFORCE.UnitOfWork uow, String descriptor) {

    }
    global void registerUoW(List<nFORCE.UnitOfWork> uowList, String descriptor) {

    }
    global void registerUoW(Set<nFORCE.UnitOfWork> uowSet, String descriptor) {

    }
    global void setCommitPriorityStrategy(nFORCE.ACommitPriorityStrategy commitPriorityStrategy) {

    }
    global void setLoggingService(nFORCE.LogService logService) {

    }
}
