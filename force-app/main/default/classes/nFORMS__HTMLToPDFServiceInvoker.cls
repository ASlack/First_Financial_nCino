/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class HTMLToPDFServiceInvoker {
    global HTMLToPDFServiceInvoker() {

    }
    @InvocableMethod(label='Auto-Generate Credit Memo and Save to Document Manager' description='Action that auto-generates credit memos and saves it to Document Manager placeholders.')
    global static List<nFORMS.HTMLToPDFServiceInvoker.OutputParams> invoke(List<nFORMS.HTMLToPDFServiceInvoker.InputParams> params) {
        return null;
    }
global class InputParams {
    @InvocableVariable(label='Comments' description='Optional field that will appear as a comment in Document Manager for the placeholder.' required=false)
    global String comment;
    @InvocableVariable(label='Record ID' description='Required field to feed in the ID of the record that triggered the flow.' required=true)
    global String contextId;
    @InvocableVariable(label='Notified Users' description='Required field with user IDs to notify credit memo cannot save to placeholder.' required=true)
    global List<String> notifiedUserIds;
    @InvocableVariable(label='Form Template ID' description='Required field that contains the ID of the credit memo template.' required=true)
    global String parentId;
    @InvocableVariable(label='Placeholder ID' description='Required field that contains the ID of the placeholder in Document Manager that will tell the system which placeholder the credit memo will save to.' required=true)
    global String placeholderId;
    global InputParams() {

    }
}
global class OutputParams {
    @InvocableVariable(label='HTTP Response' description='The http response of the service, including status, statusCode, and body.' required=true)
    global nFORMS.HTMLToPDFHttpMessage response;
}
}
