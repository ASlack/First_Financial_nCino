/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ATransferableObject {
    global ATransferableObject() {

    }
    global abstract Object getAttribute(String param0);
    global abstract Set<String> getAttributeKeys();
    global virtual Set<String> getChildrenKeys() {
        return null;
    }
    global virtual List<nFORCE.ATransferableObject> getChildren(String key) {
        return null;
    }
    global abstract String getIdentity();
    global virtual nFORCE.ATransferableObject getParent(String key) {
        return null;
    }
    global virtual Set<String> getParentKeys() {
        return null;
    }
    global abstract void setAttribute(String param0, Object param1);
    global virtual void setChildren(String key, List<nFORCE.ATransferableObject> value) {

    }
    global abstract void setIdentity(String param0);
    global virtual void setParent(String key, nFORCE.ATransferableObject value) {

    }
}
