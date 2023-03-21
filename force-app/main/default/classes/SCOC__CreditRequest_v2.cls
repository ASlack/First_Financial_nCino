/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CreditRequest_v2 {
    global Id accountId;
    global String accountRef;
    global Id contactId;
    global String contactRef;
    global Map<String,SCOC.SimpleFieldDescriptor_v2> fields;
    global Boolean isConsumer;
    global Boolean isJoint;
    global String joinKey;
    global SCOC.CreditRequest_v2.PullCategoryEnum pullCategory;
    global SCOC.CreditRequest_v2.PullTypeEnum pullType;
    global Integer sortOrder;
    global List<String> validationErrors;
    global CreditRequest_v2() {

    }
    global CreditRequest_v2(Id accountId, Id contactId, Integer sortOrder, Boolean isJoint, Boolean isConsumer, String joinKey, Map<String,SCOC.SimpleFieldDescriptor_v2> fields, SCOC.CreditRequest_v2.PullTypeEnum pullType, SCOC.CreditRequest_v2.PullCategoryEnum pullCategory) {

    }
global enum PullCategoryEnum {Commercial, Consumer}
global enum PullTypeEnum {Business, Hard, Soft}
}
