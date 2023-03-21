/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class AWorkflow implements nFORCE.IReflectType, nFORCE.IServiceLocator {
    global AWorkflow() {

    }
    global virtual nFORCE.AWorkflow configureServiceProvider(String key, System.Type providerType) {
        return null;
    }
    global virtual nFORCE.AWorkflow configureServiceProvider(String key, Object providerInstance) {
        return null;
    }
    global virtual nFORCE.AWorkflow configureServiceProviders(List<System.Type> serviceProviders) {
        return null;
    }
    global virtual nFORCE.AWorkflow configureServiceProviders(Map<String,System.Type> serviceProviders) {
        return null;
    }
    global virtual nFORCE.AWorkflow configureStep(String stepKey, System.Type stepType) {
        return null;
    }
    global virtual nFORCE.AWorkflow configureStep(String stepKey, nFORCE.AStep stepInstance) {
        return null;
    }
    global virtual nFORCE.AWorkflow configureSteps(List<System.Type> steps) {
        return null;
    }
    global virtual nFORCE.AWorkflow configureSteps(Map<String,System.Type> stepsByKey) {
        return null;
    }
    global virtual nFORCE.AWorkflow configureSteps(Map<String,nFORCE.AStep> stepsByKey) {
        return null;
    }
    global virtual String getCustomIdentity() {
        return null;
    }
    global virtual nFORCE.AOrchestrator getOrchestrator() {
        return null;
    }
    global virtual List<String> getOrderedStepKeys() {
        return null;
    }
    global virtual nFORCE.IState getState() {
        return null;
    }
    global abstract System.Type getType();
    global virtual Object locate(System.Type classType) {
        return null;
    }
    global virtual Object locate(String name) {
        return null;
    }
    global virtual void register(String name, System.Type instanceType) {

    }
    global virtual void register(String name, Object instance) {

    }
    global virtual void run() {

    }
    global virtual void setCustomIdentity(String customIdentity) {

    }
    global virtual void setOrchestrator(nFORCE.AOrchestrator orchestrator) {

    }
    global virtual void setState(nFORCE.IState state) {

    }
    global virtual void shortCircuit() {

    }
    global virtual void throwExceptions() {

    }
}
