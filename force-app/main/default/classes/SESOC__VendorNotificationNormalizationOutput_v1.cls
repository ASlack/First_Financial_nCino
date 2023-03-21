/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class VendorNotificationNormalizationOutput_v1 {
    global List<String> errorMessages;
    global List<SESOC.EventNotification_v1> eventList;
    global SESOC.VendorNotificationNormalizationOutput_v1.NormalizationOutputStatus outputStatus;
    global VendorNotificationNormalizationOutput_v1() {

    }
global enum NormalizationOutputStatus {BAD_REQUEST_ERROR, PROCESSING_ERROR, SUCCESSFUL}
}
