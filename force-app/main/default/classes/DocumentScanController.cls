/**
 * @description       : Controller to provide backend services to Document Scan UI components
 * @author            : Zennify
 * @group             : 
 * @last modified on  : 06-27-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
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
  public static void parseDocument(String loanNumber, String documentId){
    try {
      System.debug(' controller document : ' + documentId);
      System.debug(' loan : ' + loanNumber);
        String endpointUrl = 'https://calm-escarpment-43807-8fc0d96ffcfb.herokuapp.com?contentversionId='+documentId+'&entityId='+loanNumber; 
    
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint(endpointUrl);
        httpRequest.setMethod('GET');  // Replace with the appropriate HTTP method (GET, POST, etc.)
    
        HttpResponse httpResponse = new HttpResponse();
    
       
            // Perform the callout
            httpResponse = new Http().send(httpRequest);
    
            // Process the response
            if (httpResponse.getStatusCode() == 200) {
                // Callout succeeded, handle the response data
                String responseText = httpResponse.getBody();
                System.debug('Response: ' + responseText);
            } else {
                // Callout failed, handle the error
                System.debug('Callout error: HTTP status code ' + httpResponse.getStatusCode());
            }
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}