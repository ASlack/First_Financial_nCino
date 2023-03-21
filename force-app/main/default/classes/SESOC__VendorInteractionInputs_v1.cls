/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class VendorInteractionInputs_v1 {
    global static Map<SESOC.VendorInteractionType,System.Type> InteractionTypeToOutputMap;
    global VendorInteractionInputs_v1() {

    }
global virtual class ADocPrepVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 {
    global Map<Id,Contact> contactMapByAccountId;
    global Map<Id,String> document_SalesforceIdToVendorIdMap;
    global String documentCollectionIndexId;
    global Map<Id,String> recipient_SalesforceIdToVendorIdMap;
    global Map<String,SESOC.ESignatureDocumentTaggingMetadata_v1> taggingMetadataMap;
    global Map<Id,User> userMapById;
    global ADocPrepVPIInput_v1() {

    }
}
global virtual class AVendorInteractionInput_v1 {
    global String accessToken;
    global SESOC.VendorInteractionType actionType;
    global Map<String,String> pluginConfiguration;
    global String vendorPackageId;
    global SESOC.WorkflowType workflowType;
    global AVendorInteractionInput_v1() {

    }
}
global class AddDocumentToPackageVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.ADocPrepVPIInput_v1 {
    global ContentVersion contentVersionRecord;
    global Map<String,String> customDocumentData;
    global Boolean eVault;
    global AddDocumentToPackageVPIInput_v1() {

    }
}
global class CancelPackageVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 {
    global CancelPackageVPIInput_v1() {

    }
}
global class CreatePackageVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.ADocPrepVPIInput_v1 {
    global List<Contact> contactList;
    global String packageName;
    global Map<Id,SESOC.RecipientConfigurationSettings_v1> recipientConfiguration;
    global List<User> userList;
    global CreatePackageVPIInput_v1() {

    }
}
global class DownloadDocumentVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 {
    global String vendorDocumentId;
    global DownloadDocumentVPIInput_v1() {

    }
}
global class GetRecipientCeremonyURLVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 {
    global String context;
    global String storedSigningMethod;
    global String vendorRecipientId;
    global GetRecipientCeremonyURLVPIInput_v1() {

    }
}
global class GetRetrieveCollectionMetadataVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 {
    global Map<String,String> VendorIdsToSFDocumentIdsMap;
    global GetRetrieveCollectionMetadataVPIInput_v1() {

    }
}
global class GetTaggingUrlVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 {
    global GetTaggingUrlVPIInput_v1() {

    }
}
global class SendPackageForSignatureVPIInput_v1 extends SESOC.VendorInteractionInputs_v1.AVendorInteractionInput_v1 {
    global String customMessage;
    global SendPackageForSignatureVPIInput_v1() {

    }
}
}
