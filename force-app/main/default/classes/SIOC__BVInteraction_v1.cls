/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class BVInteraction_v1 {
    global String action;
    global EFPIO.HttpCalloutUtility_v1.HttpCalloutResponse_v1 calloutResponse;
    global EFPIO.HttpCalloutUtility_v1.HttpCalloutSettings_v1 calloutSettings;
    global String comment;
    global Id contextId;
    global String correlationId;
    global SIOC.BVAction currentAction;
    global String customActionName;
    global List<String> errors;
    global SIOC__SIOCInteraction__c interactionPersistenceRecord {
        get;
    }
    global Boolean isSuccessful;
    global MTRNS.MapDataSource_v1 mapDataSource;
    global List<String> messages;
    global Id parentInteractionId;
    global String vendorProviderFullyQualifiedClassName;
    global String vendorProviderName;
    global String vendorRefNum;
    global String vendorStatus;
    global BVInteraction_v1() {

    }
}
