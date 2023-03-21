/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ColPledgesAutoUpdaterInvoker {
    global ColPledgesAutoUpdaterInvoker() {

    }
    @InvocableMethod(label='Collateral Pledges Auto Updater' description='This invocable method automatically applies Advance Rate and Amount Pledged to a Collateral Pledged Record based on an org's matrix manager configuration.')
    global static List<LLC_BI.ColPledgesAutoUpdaterInvoker.OutputParams> invoke(List<LLC_BI.ColPledgesAUInvokerArgDto> args) {
        return null;
    }
global class OutputParams {
    @AuraEnabled
    @InvocableVariable( required=false)
    global List<LLC_BI.CollateralPledgedInvokerDto> pledges;
    global OutputParams() {

    }
}
}
