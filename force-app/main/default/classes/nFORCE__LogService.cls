/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class LogService {
    global LogService() {

    }
    global virtual void addLog(nFORCE.LogItem log) {

    }
    global void addLog(System.LoggingLevel logLevel, String title, Boolean message) {

    }
    global void addLog(System.LoggingLevel logLevel, String title, Integer message) {

    }
    global void addLog(System.LoggingLevel logLevel, String title, String message) {

    }
    global virtual void addLogWithoutCheckingProvider(nFORCE.LogItem log) {

    }
    global virtual Boolean canLog(System.LoggingLevel logLevel) {
        return null;
    }
    global void disableMethodTelemetry() {

    }
    global void enableMethodTelemetry() {

    }
    global nFORCE.ALogProvider getLogProvider() {
        return null;
    }
    global nFORCE.UnitOfWork getUnitOfWork() {
        return null;
    }
    global Boolean isMethodTelemetryEnabled() {
        return null;
    }
    global virtual void methodEntranceLogging(nFORCE.LogItem log) {

    }
    global virtual void methodEntranceLogging(System.LoggingLevel logLevel, String className, String methodName) {

    }
    global virtual void methodExitLogging(nFORCE.LogItem log) {

    }
    global virtual void methodExitLogging(System.LoggingLevel logLevel, String className, String methodName) {

    }
    global virtual void methodLogging(nFORCE.LogService.METHOD_STATE methodState, nFORCE.LogItem log) {

    }
    global void save() {

    }
    global void setLogProvider(nFORCE.ALogProvider logProvider) {

    }
global enum METHOD_STATE {METHOD_ENTRANCE, METHOD_EXIT}
}
