public without sharing class ContentVersionUtil {
    Map<Id, ContentVersion> newItemsMap;
    List<ContentVersion> conVerToProcess;
    List<LLC_BI__AccountDocument__c> acctDocList;
    List<DocManBase> docManBaseList;

    public ContentVersionUtil(Map<Id, SObject> newItems) {
        newItemsMap                 = (Map<Id, ContentVersion>)newItems;
        conVerToProcess             = new List<ContentVersion>();
        acctDocList                 = new List<LLC_BI__AccountDocument__c>();
        docManBaseList          	= new List<DocManBase>();
    }

    public void processContVerRecs(){
        for(ContentVersion c : newItemsMap.values()) {
            DocManBase docManBaseItem                       = new DocManBase();
            DocManAttributes versionAttribute               = new DocManAttributes();
            docManBaseItem.document.versions                = new List<DocManVersionAttributes>();
            DocManVersionAttributes dmvAttributes           = new DocManVersionAttributes();
            //Set Version Attributes
            versionAttribute.internalContent                = c.Id;
            dmvAttributes.attributes                        = versionAttribute;
            docManBaseItem.document.versions.add(dmvAttributes);
            //Relate the account to the content Version if present
            DocManBase acctDocManBaseItem               = new DocManBase(docManBaseItem);
            DocManAttributes admAttributes              = new DocManAttributes();
            admAttributes.contextIdentity               = c.FirstPublishLocationId;
            admAttributes.name                          = c.PathOnClient;
            acctDocManBaseItem.attributes               = admAttributes;
            docManBaseList.add(acctDocManBaseItem);
        }
        if(docManBaseList.size() > 0) {
            System.debug(docManBaseList);
            NDOC.PlaceholderAssociatorInvoker_v1.InputParam params      = new NDOC.PlaceholderAssociatorInvoker_v1.InputParam();
            params.addNewVersion                                        = true;
            params.placeholders                                         = JSON.serialize(docManBaseList, true);
            NDOC.PlaceholderAssociatorInvoker_v1.invoke(new List<NDOC.PlaceholderAssociatorInvoker_v1.InputParam>{params});
        }  
    }

    public class DocManBase {
        public DocManDocument document;
        public DocManAttributes attributes;

        public DocManBase(DocManBase d) {
            this.document       = d.document;
            this.attributes     = d.attributes;
        }

        public DocManBase() {
            this.document       = new DocManDocument();
            this.attributes     = new DocManAttributes();
        }
    }

    public class DocManAttributes {
        public String contextIdentity;
        public String category;
        public String description;
        public String Name;
        public String internalContent;
    }
    
    public class DocManVersionAttributes {
        public DocManAttributes attributes;
    }

    public class DocManDocument {
        public List<DocManVersionAttributes> versions;
    }
}