/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global interface IBusinessSearchVendorProvider_v1 {
    Map<String,SObject> blendedMapToSObjects(SIOC.BusinessSelectResult_v1 param0);
    String getLabel();
    String getProviderName();
    SIOC.BusinessSearchInputs_v1 loadSearch();
    SIOC.BusinessSaveResult_v1 postBusinessSaveHandler(SIOC.BusinessSelectResult_v1 param0, Map<String,SObject> param1);
    SIOC.BusinessSaveResult_v1 save(SIOC.BusinessSelectResult_v1 param0);
    SIOC.BusinessSearchResult_v1 search(Map<String,String> param0);
    SIOC.BusinessSelectResult_v1 selectBusiness(Map<String,String> param0);
    void setLoggingProvider(EFPIO.ILoggingProvider_v1 param0);
}
