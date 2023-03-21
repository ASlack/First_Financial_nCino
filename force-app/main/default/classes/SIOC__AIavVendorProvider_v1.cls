/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class AIavVendorProvider_v1 {
    global AIavVendorProvider_v1() {

    }
    global abstract void createCustomer(SIOC.IavInteraction_v1 param0);
    global abstract EFPIO.HttpCalloutUtility_v1.HttpCalloutSettings_v1 generateCalloutSettings(SIOC.IavInteraction_v1 param0);
    global abstract String getClassName();
    global virtual EFPIO.LoggingService_v1 getLoggingService() {
        return null;
    }
    global abstract SIOC.VendorConfigurationSettings_v1 getProviderConfiguration();
    global abstract String getUIPageName(String param0);
    global abstract String getVendorPluginName();
    global abstract void getVerifiedAccounts(SIOC.IavInteraction_v1 param0);
    global virtual EFPIO.HttpCalloutUtility_v1.HttpCalloutResponse_v1 performCallout(EFPIO.HttpCalloutUtility_v1.HttpCalloutSettings_v1 calloutSettings) {
        return null;
    }
    global virtual void registerAPIInteraction(SIOC.IavInteraction_v1 interaction, EFPIO.HttpCalloutUtility_v1.HttpCalloutSettings_v1 calloutSettings, EFPIO.HttpCalloutUtility_v1.HttpCalloutResponse_v1 calloutResponse, String calloutDescriptor) {

    }
    global virtual void registerUoWForStorage(nFORCE.UnitOfWork uow, Boolean mustCommitWork) {

    }
}
