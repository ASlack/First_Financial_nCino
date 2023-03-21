/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MapInstruction_v1 {
    global List<MTRNS.MapInstructionAttribute_v1> attributes {
        get;
        set;
    }
    global String finalTargetPath {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global List<MTRNS.MapInstruction_v1> instructions;
    global Boolean isActive {
        get;
        set;
    }
    global Integer placementOrder {
        get;
        set;
    }
    global List<MTRNS.MappingSelectorKeyModel_v1> selectorKeys;
    global Boolean skipAttributeValueObtain {
        get;
        set;
    }
    global Boolean skipCreatingNewReferences {
        get;
        set;
    }
    global Boolean skipIfBlank {
        get;
        set;
    }
    global Boolean skipTransformationDataValueObtain {
        get;
        set;
    }
    global Boolean skipValueObtain {
        get;
        set;
    }
    global String stateSource {
        get;
        set;
    }
    global String stateSourceKey {
        get;
        set;
    }
    global Object targetDataValue {
        get;
        set;
    }
    global MTRNS.MapInstruction_v1.DataValueType targetDataValueType {
        get;
        set;
    }
    global String targetPath {
        get;
        set;
    }
    global String transformationFormula {
        get;
        set;
    }
    global Boolean useEmptyElementForBlankValue {
        get;
        set;
    }
    global String valueSource {
        get;
        set;
    }
    global MapInstruction_v1() {

    }
global enum DataValueType {NODES_TYPE, STRING_TYPE}
}
