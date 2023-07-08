/**
 * @description       : Controller to provide backend services to Document Scan UI components
 * @author            : Zennify
 * @group             : 
 * @last modified on  : 07-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public without sharing class DocumentScanController {
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
  public static String parseDocument(String loanNumber, String documentId){
    try {
		    System.debug(' loan id : ' + loanNumber + ' doc id : ' + documentId);
        String endpointUrl = 'https://ffin-celery-server-ba90c5b6c33e.herokuapp.com/api/pdf-parser/barcode?contentVersionId='+documentId+'&entityId='+loanNumber; 
        List<String> taskIds = new List<String>();  
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint(endpointUrl);
        httpRequest.setTimeout(120000);
        httpRequest.setMethod('GET'); 
    
        HttpResponse httpResponse = new HttpResponse();
            httpResponse = new Http().send(httpRequest);
  
            if (httpResponse.getStatusCode() == 202) {
                // Callout succeeded, handle the response data
                String responseText = httpResponse.getBody();
                Map<String, Object> parsedResponse = (Map<String, Object>) JSON.deserializeUntyped(httpResponse.getBody());
                if (parsedResponse.containsKey('task_id')) {
                    taskIds.add((String) parsedResponse.get('task_id'));
                }
            } else {
                System.debug(LoggingLevel.ERROR, 'Callout error: HTTP status code ' + httpResponse.getStatusCode());
                System.debug(LoggingLevel.ERROR, 'Callout error: message ' + httpResponse.getBody());
            }
            System.debug('taskIds : ' + taskIds);
            if (taskIds.size() > 0) {
                System.enqueueJob(new DocumentScanControllerAsync(taskIds, 1), 1);
            }
        
        return taskIds[0];

    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
    
  @AuraEnabled
  public static List<ContentDocument> getContentDocuments(String taskid) {
      System.debug(' backend task id : ' + taskId);
    List<ContentDocument> docs = new List<ContentDocument>();
    try {
      docs = [
        SELECT Id, 
               Title
        FROM ContentDocument 
        WHERE Id IN (SELECT ContentDocumentId FROM ContentVersion WHERE ExternalJobId__c = :taskId)
      ];
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
	System.debug(' list of docs : ' + docs);
    return docs;
  }

  public class DocumentScanControllerAsync implements Queueable , Database.AllowsCallouts {
    public List<String> taskIds { get; set; }
    public Integer attempts { get; set; }

    public DocumentScanControllerAsync(List<String> taskIds, Integer attempts) {
      this.taskIds = taskIds;
      this.attempts = attempts;
    } 

    public void execute(QueueableContext context) {
      if (attempts > 5) {
        System.debug(LoggingLevel.ERROR, 'Callout error: DocumentScanControllerAsync exceeded max attempts');
        return;
      }

      attempts++;

      String endpointUrl = 'https://ffin-celery-server-ba90c5b6c33e.herokuapp.com/status?task_id='+taskIds[0]; 

      HttpRequest httpRequest = new HttpRequest();
      httpRequest.setEndpoint(endpointUrl);
      httpRequest.setTimeout(120000);
      httpRequest.setMethod('GET'); 
  
      HttpResponse httpResponse = new HttpResponse();
      httpResponse = new Http().send(httpRequest);
        
      if (httpResponse.getStatusCode() == 500){
        System.debug(LoggingLevel.ERROR, 'Callout error: HTTP status code ' + httpResponse.getStatusCode() + ' message: ' + httpResponse.getBody());
        return;
      }
      
      if (httpResponse.getStatusCode() == 200) {
        Map<Id, ContentVersion> idToContentVersionMap = new Map<Id, ContentVersion>();
          List<ContentVersion> contentVersions = [select Id, Title, FirstPublishLocationId, PathOnClient from ContentVersion where ExternalJobId__c in :taskIds];
          for ( ContentVersion c : contentVersions){
            idToContentVersionMap.put(c.Id, c);
          }
          if(idToContentVersionMap.size() > 0){
            new ContentVersionUtil(idToContentVersionMap).processContVerRecs();
           System.debug(' submit to doc man content versions : ' + idToContentVersionMap);
          }
      } else if(httpResponse.getStatusCode() == 202) {
                System.enqueueJob(new DocumentScanControllerAsync(taskIds, attempts), 2);
      } 
    }
  }
}