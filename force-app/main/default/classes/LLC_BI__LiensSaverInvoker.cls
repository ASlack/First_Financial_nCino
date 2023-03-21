/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class LiensSaverInvoker {
    global LiensSaverInvoker() {

    }
    @InvocableMethod(label='Collateral Liens Saver' description='This invocable method saves collateral liens.')
    global static List<LLC_BI.LiensSaverInvoker.OutputParams> invoke(List<LLC_BI.LiensSaverInvokerArgDto> args) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable(label='Collateral Lien Identities' description='This output is a list of Lien Ids the service creates.' required=false)
    global List<Id> lienIds;
    global OutputParams() {

    }
}
}
