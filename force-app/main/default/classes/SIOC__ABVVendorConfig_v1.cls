/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ABVVendorConfig_v1 {
    global Map<String,nFUSE__Plugin_Constants__mdt> globalConstants;
    global Map<String,String> pluginConfiguration;
    global ABVVendorConfig_v1() {

    }
    global abstract String getClassName();
    global abstract EFPIO.ConfigurationBase_v1 getConfigurationInstance();
    global abstract List<Schema.SObjectType> getInteractionAssociativeTypes();
    global abstract String getProviderPluginName();
    global virtual void setGlobalConstants() {

    }
    global virtual void setPluginConfiguration() {

    }
    global abstract Boolean shouldLogRequests();
    global abstract Boolean shouldLogResponses();
}
