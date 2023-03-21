/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global interface IAccessTokenProvider_v1 {
    String getClassName();
    SESOC.TokenInfo_v1 getToken();
    void setLoggingProvider(EFPIO.ILoggingProvider_v1 param0);
    void setNamedCredentialOrEndpoint(String param0);
    void setRefreshWithinSeconds(Integer param0);
    Boolean shouldRefresh(SESOC.TokenInfo_v1 param0);
}
