/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class AReflectiveStateStore implements nFORCE.IReflectType, nFORCE.IStateStore {
    global AReflectiveStateStore() {

    }
    global abstract Boolean containsKey(String param0);
    global abstract nFORCE.AReflectiveStateStore deserializeStore();
    global abstract Boolean equals(nFORCE.IStateStore param0);
    global abstract Object get(String param0);
    global abstract Set<String> getKeys();
    global abstract System.Type getType();
    global abstract void put(String param0, Object param1);
    global abstract void remove(String param0);
    global abstract nFORCE.AReflectiveStateStore serializeStore();
    global abstract Integer size();
}
