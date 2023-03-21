/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global interface IVendorProvider_v1 {
    SESOC.IVendorNotificationNormalizer_v1 getNotificationNormalizer();
    String getProviderName();
    SESOC.RequestAndResponseDefinition_v1 getRequestAndResponseDefinition();
    String getVendorPluginName();
    String getVendorPluginVersion();
    SESOC.VendorConfigurationSettings_v1 getVendorProviderConfiguration();
    SESOC.IVendorProviderInteraction_v1 getVendorProviderInteraction(SESOC.VendorInteractionType param0);
    void performPluginConfigurationValidation();
    Boolean supportsAdHoc();
    Boolean supportsDocPrep();
    Boolean useAccessTokenProvider();
}
