/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CreditInteraction_v1 {
    global EFPIO.HttpCalloutUtility_v1.HttpCalloutResponse_v1 calloutResponse {
        get;
        set;
    }
    global EFPIO.HttpCalloutUtility_v1.HttpCalloutSettings_v1 calloutSettings {
        get;
        set;
    }
    global List<EFPIO.DynamicInsertObject_v1> complexDecisionData {
        get;
        set;
    }
    global String correlationId {
        get;
        set;
    }
    global String creditReportExternalId {
        get;
        set;
    }
    global Boolean isConsumer {
        get;
        set;
    }
    global Boolean isSuccessful {
        get;
        set;
    }
    global String mappedRequestBody {
        get;
        set;
    }
    global Set<String> messages {
        get;
        set;
    }
    global String originalRequest {
        get;
        set;
    }
    global Map<String,String> pluginConfiguration {
        get;
        set;
    }
    global SCOC__SCOCProviderSettings__c providerSettings {
        get;
        set;
    }
    global List<EFPIO.DynamicInsertObject_v1> quickDecisionData {
        get;
        set;
    }
    global String serializedFastResponseSobject {
        get;
        set;
    }
    global List<SCOC.CreditRequest_v1> simpleRequests {
        get;
        set;
    }
    global String stage {
        get;
        set;
    }
    global String transactionLogExternalId {
        get;
        set;
    }
    global CreditInteraction_v1() {

    }
    global SCOC__SCOCProviderSettings__c extractProviderSettings(Map<String,Object> untyped) {
        return null;
    }
    global Map<String,Object> getComplexProcessingData() {
        return null;
    }
}
