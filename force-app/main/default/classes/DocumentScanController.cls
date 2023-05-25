public with sharing class DocumentScanController {
  @AuraEnabled
  public static List<LLC_BI__Loan__c> queryLoans(String loanNumber) {
    List<LLC_BI__Loan__c> matchingLoans = new List<LLC_BI__Loan__c>();
    if (String.isEmpty(loanNumber)) {
      System.debug('returning early because loanNumber is empty');
      return matchingLoans;
    }
    try {
      matchingLoans = [
        SELECT Id, Name, LLC_BI__lookupKey__c
        FROM LLC_BI__Loan__c
        WHERE LLC_BI__lookupKey__c = :loanNumber
      ];
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }

    System.debug('query successful; matchingLoans is: ' + matchingLoans);
    return matchingLoans;
  }
}