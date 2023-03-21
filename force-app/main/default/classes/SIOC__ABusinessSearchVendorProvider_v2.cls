/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ABusinessSearchVendorProvider_v2 {
    global ABusinessSearchVendorProvider_v2() {

    }
    @TestVisible
    global virtual void addLog(System.LoggingLevel logLevel, String status, String details, Boolean triggerPushTopic) {

    }
    global abstract String getClassName();
    global abstract String getLabel();
    global virtual EFPIO.LoggingService_v1 getLoggingService() {
        return null;
    }
    global virtual SIOC.GlobalConstants_v1.ProcessContext getProcessContext() {
        return null;
    }
    global abstract String getProviderName();
    global virtual SIOC.PortalConfiguration_v1 loadPortalConfiguration() {
        return null;
    }
    global abstract SIOC.BusinessSearchInputs_v1 loadSearch();
    global virtual void methodEntranceLogging(System.LoggingLevel logLevel, String methodName) {

    }
    global virtual void methodExitLogging(System.LoggingLevel logLevel, String methodName) {

    }
    global virtual SIOC.BusinessSaveResult_v1 save(SIOC.BusinessSelectResult_v1 businessDetails) {
        return null;
    }
    global abstract SIOC.BusinessSearchResult_v1 search(Map<String,String> param0);
    global abstract SIOC.BusinessSelectResult_v1 selectBusiness(Map<String,String> param0);
    global virtual void setLoggingProvider(EFPIO.ILoggingProvider_v1 loggingProvider) {

    }
    global virtual void setLoggingService(EFPIO.LoggingService_v1 loggingService) {

    }
}
