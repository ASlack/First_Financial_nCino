/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class BusinessSearchInputs_v1 {
    global SIOC.OperationDetails_v1 details {
        get;
        set;
    }
    global List<SIOC.BusinessSearchInputs_v1.BusinessSearchInput> displayInputs {
        get;
    }
    global List<SIOC.BusinessSearchInputs_v1.BusinessSearchInput> hiddenInputs {
        get;
    }
    global List<SIOC.BusinessSearchInputs_v1.BusinessSearchInput> inputs {
        get;
        set;
    }
    global BusinessSearchInputs_v1() {

    }
global class BusinessSearchInput {
    global String label {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global List<SIOC.BusinessSearchInputs_v1.Option> options {
        get;
        set;
    }
    global Boolean required {
        get;
        set;
    }
    global String sourceField {
        get;
        set;
    }
    global String type {
        get;
        set;
    }
    global String value {
        get;
        set;
    }
    global BusinessSearchInput() {

    }
}
global class Option {
    global String label {
        get;
        set;
    }
    global String value {
        get;
        set;
    }
    global Option() {

    }
}
}
