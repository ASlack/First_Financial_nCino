/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ALogProvider {
    global ALogProvider() {

    }
    global abstract void add(nFORCE.LogItem param0);
    global virtual Boolean canLog(System.LoggingLevel logLevelToCheckFor) {
        return null;
    }
    global virtual String getContext() {
        return null;
    }
    global virtual String getCorrelationId() {
        return null;
    }
    global virtual Boolean getIsInitialized() {
        return null;
    }
    global virtual System.LoggingLevel getLoggingLevel() {
        return null;
    }
    global abstract List<nFORCE.LogItem> getLogs();
    global virtual String getSubContext() {
        return null;
    }
    global abstract nFORCE.UnitOfWork getUnitOfWork();
    global abstract void initialize();
    global virtual void save() {

    }
    global virtual void setContext(String context) {

    }
    global virtual void setCorrelationId(String correlationId) {

    }
    global virtual void setIsInitialized(Boolean isInitialized) {

    }
    global virtual void setLoggingLevel(System.LoggingLevel loggingLevel) {

    }
    global virtual void setSubContext(String subContext) {

    }
}
