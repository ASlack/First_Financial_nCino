/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class AAccessTokenProvider_v1 {
    global EFPIO.LoggingService_v1 loggingService;
    global String namedCredentialOrEndpoint;
    global Integer refreshWithinSeconds;
    global AAccessTokenProvider_v1() {

    }
    global abstract String getClassName();
    global abstract EFPIO.TokenInfo_v1 getToken();
    global abstract String getTokenIdentifier();
    global void setLoggingService(EFPIO.LoggingService_v1 loggingService) {

    }
    global void setNamedCredentialOrEndpoint(String namedCredentialOrEndpoint) {

    }
    global virtual void setRefreshWithinSeconds(Integer refreshWithinSeconds) {

    }
    global virtual Boolean shouldRefresh(EFPIO.TokenInfo_v1 token) {
        return null;
    }
}
