/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class PluginConfigurationManager_v1 {
    global PluginConfigurationManager_v1() {

    }
    global void addKeyToOmitFromMessaging(String key) {

    }
    global void addPluginConfiguration(String key, String value, String dataType, Boolean isEncrypted) {

    }
    global void addPropertyLabelToApiKeyTranslation(String label, String apiKey) {

    }
    global abstract void definePluginConfigurations();
    global virtual Map<String,String> getConfigurationPropertiesForMessages() {
        return null;
    }
    global EFPIO.xPath getConfigurationsAsXML() {
        return null;
    }
    global abstract String getPluginName();
    global virtual String getPluginVersion() {
        return null;
    }
    global virtual void setApiNamesForMessaging() {

    }
    global virtual void setKeysToOmitFromMessaging() {

    }
    global virtual void upsertConfigurations() {

    }
}
