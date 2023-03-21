/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CreditRequest_v1 {
    global Id accountId {
        get;
        set;
    }
    global String accountRef {
        get;
        set;
    }
    global Id contactId {
        get;
        set;
    }
    global String contactRef {
        get;
        set;
    }
    global Map<String,SCOC.SimpleFieldDescriptor_v1> fields {
        get;
        set;
    }
    global Boolean isConsumer {
        get;
        set;
    }
    global Boolean isJoint {
        get;
        set;
    }
    global String joinKey {
        get;
        set;
    }
    global SCOC.CreditRequest_v1.PullCategoryEnum pullCategory {
        get;
        set;
    }
    global SCOC.CreditRequest_v1.PullTypeEnum pullType {
        get;
        set;
    }
    global Integer sortOrder {
        get;
        set;
    }
    global List<String> validationErrors {
        get;
        set;
    }
    global CreditRequest_v1() {

    }
    global CreditRequest_v1(Id accountId, Id contactId, Integer sortOrder, Boolean isJoint, Boolean isConsumer, String joinKey, Map<String,SCOC.SimpleFieldDescriptor_v1> fields, SCOC.CreditRequest_v1.PullTypeEnum pullType, SCOC.CreditRequest_v1.PullCategoryEnum pullCategory) {

    }
global enum PullCategoryEnum {Business, Commercial, Consumer}
global enum PullTypeEnum {Business, Hard, Soft}
}
