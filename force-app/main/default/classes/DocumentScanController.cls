/**
 * @description       : Controller to provide backend services to Document Scan UI components
 * @author            : Zennify
 * @group             : 
 * @last modified on  : 06-05-2023
 * @last modified by  : Cristiano Sinadino
**/
public with sharing class DocumentScanController {
  @AuraEnabled
  public static List<LLC_BI__Loan__c> queryLoans(String loanNumber) {
    List<LLC_BI__Loan__c> matchingLoans = new List<LLC_BI__Loan__c>();
    if (String.isEmpty(loanNumber)) {
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

    return matchingLoans;
  }

  @AuraEnabled
  public static void parseDocument(String loanNumber, ContentVersion document){
	try {
		System.debug(' controller document : ' + document);
		System.debug(' loan : ' + loanNumber);
		
	} catch (Exception e) {
		throw new AuraHandledException(e.getMessage());
	}
  }
}