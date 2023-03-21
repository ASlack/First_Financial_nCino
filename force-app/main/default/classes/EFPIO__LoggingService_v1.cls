/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class LoggingService_v1 {
    global LoggingService_v1(EFPIO.ILoggingProvider_v1 loggingProvider) {

    }
    global LoggingService_v1(EFPIO.ILoggingProvider_v1 loggingProvider, Boolean methodTelemetryEnabled) {

    }
    global virtual void AddLog(System.LoggingLevel logLevel, String status, Boolean details) {

    }
    global virtual void AddLog(System.LoggingLevel logLevel, String status, Integer details) {

    }
    global void addLog(System.LoggingLevel logLevel, String status, String details) {

    }
    global void addLog(System.LoggingLevel logLevel, String status, String details, Boolean triggerPushTopic) {

    }
    global void addLogWithoutCheckingProvider(System.LoggingLevel logLevel, String status, String details, Boolean triggerPushTopic) {

    }
    global Boolean canLog(System.LoggingLevel logLevel) {
        return null;
    }
    global void disableMethodTelemetry() {

    }
    global void enableMethodTelemetry() {

    }
    global EFPIO.ILoggingProvider_v1 getLoggingProvider() {
        return null;
    }
    global Boolean isMethodTelemetryEnabled() {
        return null;
    }
    global virtual void methodEntranceLogging(System.LoggingLevel logLevel, String className, String methodName) {

    }
    global virtual void methodExitLogging(System.LoggingLevel logLevel, String className, String methodName) {

    }
    global virtual void methodLogging(EFPIO.LoggingService_v1.METHOD_STATE methodState, System.LoggingLevel logLevel, String className, String methodName) {

    }
    global void setLoggingProvider(EFPIO.ILoggingProvider_v1 loggingProvider) {

    }
global enum METHOD_STATE {METHOD_ENTRANCE, METHOD_EXIT}
}
