/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class PortalRegHandler_v2 implements Auth.SamlJitHandler {
    global Map<String,Map<String,String>> objFieldMap;
    global Map<String,String> userSearchFieldMap;
    global PortalRegHandler_v2() {

    }
    global virtual void buildObjectFieldMapping() {

    }
    global virtual Map<String,Map<String,String>> buildSupplementaryDataMap(Map<String,String> attributes) {
        return null;
    }
    global virtual User buildUserFromObjectFieldMapping(User usr, Map<String,String> attributes) {
        return null;
    }
    global virtual nPortal.UserWrapper createUserWrapper(User usr, Map<String,String> attributes, String federationId) {
        return null;
    }
    global virtual User createUser(Id samlSsoProviderId, Id communityId, Id portalId, String federationIdentifier, Map<String,String> attributes, String assertion) {
        return null;
    }
    global virtual List<User> findExistingUsers(String federationId, Map<String,String> attributes) {
        return null;
    }
    @Future(callout=false)
    global static void handleUserAssociations(Id userId, String supplementaryDataJSON) {

    }
    global virtual User prioritizeExistingUsers(List<User> existingUsers, String federationIdentifier, Map<String,String> attributes) {
        return null;
    }
    global virtual User updateUser(Id userId, Map<String,String> attributes, String federationIdentifier) {
        return null;
    }
    global virtual void updateUser(Id userId, Id samlSsoProviderId, Id communityId, Id portalId, String federationIdentifier, Map<String,String> attributes, String assertion) {

    }
}
