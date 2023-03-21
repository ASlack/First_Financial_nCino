/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class AFunctionBase_v1 {
    global List<Object> data;
    global MTRNS.MapInstruction_v1 mappingInstruction;
    global List<MTRNS.MapInstruction_v1> mappingInstructions;
    global AFunctionBase_v1() {

    }
    global virtual void addPerformanceConcern(String concern) {

    }
    global void addValidationConcern(String concern) {

    }
    global abstract String getClassName();
    global MTRNS.MapDataSource_v1 getDataSource() {
        return null;
    }
    global Object getDataSourceOriginalValue(String stateSource, String stateSourceKey) {
        return null;
    }
    global Object getDataSourceValue(String stateSource, String stateSourceKey) {
        return null;
    }
    global Object getDataSourceValue(String stateSource, String stateSourceKey, Boolean doNotCache) {
        return null;
    }
    global EFPIO.ILoggingProvider_v1 getLoggingProvider() {
        return null;
    }
    global virtual EFPIO.LoggingService_v1 getLoggingService() {
        return null;
    }
    global void setData(List<Object> data) {

    }
    global virtual void setLoggingService(EFPIO.LoggingService_v1 logService) {

    }
    global void setMappingInstruction(MTRNS.MapInstruction_v1 mappingInstruction) {

    }
    global void setMappingInstructions(List<MTRNS.MapInstruction_v1> mappingInstructions) {

    }
}
