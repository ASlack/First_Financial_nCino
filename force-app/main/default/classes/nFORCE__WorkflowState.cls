/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class WorkflowState extends nFORCE.AState {
    global WorkflowState() {

    }
    global virtual String getIdentity() {
        return null;
    }
    global static Object getOutputStore(nFORCE.AWorkflow workflow, String key) {
        return null;
    }
    global virtual nFORCE.IStateStore getOutputStore() {
        return null;
    }
    global static Object getStateStore(nFORCE.AWorkflow workflow, String key) {
        return null;
    }
    global virtual nFORCE.WorkTransaction getTransaction() {
        return null;
    }
    global static void putOutputStore(nFORCE.AWorkflow workflow, String key, Object instance) {

    }
    global static void putStateStore(nFORCE.AWorkflow workflow, String key, Object instance) {

    }
    global static void removeOutputStore(nFORCE.AWorkflow workflow, String key) {

    }
    global static void removeStateStore(nFORCE.AWorkflow workflow, String key) {

    }
    global virtual void setOutputStore(nFORCE.AReflectiveStateStore outputStore) {

    }
    global override virtual void setStateStore(nFORCE.IStateStore stateStore) {

    }
}
