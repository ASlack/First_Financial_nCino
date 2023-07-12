import { LightningElement, api  } from 'lwc';
import getDocuments from '@salesforce/apex/DocumentScanController.getContentVersion';
export default class DocumentScanProgressBar extends LightningElement {
    @api taskid;
    data;
    isQuerying = false;
    progress = 5;
    message = 'Scanning documents...'
    @api documents;
    isPolling = false;


    renderedCallback() {
        if (!this.isPolling) {
            this.startDataQuerying();
        }
    }


    startDataQuerying() {
        this.isPolling = true;
        this.isQuerying = setInterval(() => {
            console.log("startDataQuerying called");
            this.progress += 3;
            this.message = 'Working on it...please give us a few minutes.';
            getDocuments({ taskid: this.taskid })
                .then(result => {
    
                    if (result && result.length > 0) {
                        this.progress = 100;
                        this.message = 'Complete';

                        result.forEach(record => {
                            // Access fields of each sObject
                            console.log("Record Name: ", record.Title);
                            console.log("Record Id: ", record.Id);
                            // Process other fields as per your requirement
                        });
                        this.stopDataPolling();
                        this.eventPublisher(result);
                    }
                    
                })
                .catch(error => {
                    // Handle any errors that occurred during the Apex call
                    console.log("error: " + error);
                    this.stopDataPolling();
                });
        }, 15000); // Query every 5 seconds (adjust as per your requirement)
    }

    eventPublisher(result) {
        const documents = result.map(record => ({
            filename: record.Title,
            url: `/sfc/servlet.shepherd/version/download/${record.Id}`
        }));
        const event = new CustomEvent('documentsreceived', { 
            detail: documents
        });
        this.dispatchEvent(event);
    }



    stopDataPolling() {
        clearInterval(this.isQuerying);
        this.isPolling = false;
    }
}