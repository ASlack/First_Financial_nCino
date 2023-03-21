/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class VendorInteractionsOutputs_v1 {
    global static Map<SESOC.VendorInteractionType,System.Type> InteractionTypeToOutputMap;
    global VendorInteractionsOutputs_v1() {

    }
global virtual class AVendorInteractionOutput_v1 {
    global SESOC.VendorInteractionType actionType;
    global EFPIO.HttpCalloutUtility_v1.HttpCalloutSettings_v1 calloutSettings;
    global List<String> errorMessages;
    global Map<String,List<Object>> extraCalloutConfigurationsForLogging;
    global EFPIO.HttpCalloutUtility_v1.HttpCalloutResponse_v1 httpResponse;
    global Boolean isSuccessful;
    global AVendorInteractionOutput_v1() {

    }
}
global class AddDocumentToPackageVPIOutput_v1 extends SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 {
    global String SecondaryVendorDocumentId;
    global String VendorDocumentId;
    global AddDocumentToPackageVPIOutput_v1() {

    }
}
global class CancelPackageVPIOutput_v1 extends SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 {
    global CancelPackageVPIOutput_v1() {

    }
}
global class CreatePackageVPIOutput_v1 extends SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 {
    global Map<Id,SESOC.Recipient_v1> newRecipientInformationMap;
    global String VendorPackageId;
    global CreatePackageVPIOutput_v1() {

    }
}
global class DownloadDocumentVPIOutput_v1 extends SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 {
    global String description;
    global Blob documentBlob;
    global String fileName;
    global String newVendorId;
    global DownloadDocumentVPIOutput_v1() {

    }
}
global class GetRecipientCeremonyURLVPIOutput_v1 extends SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 {
    global String recipientCeremonyURL;
    global GetRecipientCeremonyURLVPIOutput_v1() {

    }
}
global class GetRetrieveCollectionMetadataVPIOutput_v1 extends SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 {
    global List<SESOC.DocumentInformation_v1> documentInformationList;
    global List<SESOC.Recipient_v1> recipientList;
    global GetRetrieveCollectionMetadataVPIOutput_v1() {

    }
}
global class GetTaggingUrlVPIOutput_v1 extends SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 {
    global String taggingUrl;
    global GetTaggingUrlVPIOutput_v1() {

    }
}
global class SendPackageForSignatureVPIOutput_v1 extends SESOC.VendorInteractionsOutputs_v1.AVendorInteractionOutput_v1 {
    global SendPackageForSignatureVPIOutput_v1() {

    }
}
}
