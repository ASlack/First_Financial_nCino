/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class DGFormTemplatesLoaderArgsDTO {
    @AuraEnabled
    @InvocableVariable(label='Context Object Types' description='Context object types of form templates the service retrieves.' required=false)
    global List<String> contextObjectTypes;
    @AuraEnabled
    @InvocableVariable(label='Form Template Ids' description='Identities of form templates the service retrieves.' required=false)
    global List<String> formTemplateIds;
    global DGFormTemplatesLoaderArgsDTO() {

    }
}
