import { LightningElement, api  } from 'lwc';
import getDocuments from '@salesforce/apex/DocumentScanController.getContentDocuments';
export default class DocumentScanProgressBar extends LightningElement {
    @api taskid;
    data;
    isQuerying = false;


    renderedCallback() {
        if (!this.isQuerying) {
            this.startDataQuerying();
        }
    }


    startDataQuerying() {
        this.isQuerying = setInterval(() => {
            console.log("startDataQuerying called");
            getDocuments({ taskid: this.taskid })
                .then(result => {
                    // Handle the retrieved data in the wiredData() method

                    if (this.isQuerying) {
                        clearInterval(this.isQuerying);
                    }
                    if (result && result.length > 0) {
                        result.forEach(record => {
                            // Access fields of each sObject
                            console.log("Record Name: ", record.Title);
                            console.log("Record Name: ", record.Id);
                            // Process other fields as per your requirement
                        });

                        const event = new CustomEvent('documentsreceived', { 
                            detail: result
                        });
                        console.log("event: " + event.detail);
                        this.dispatchEvent(event);
                    }
                    
                })
                .catch(error => {
                    // Handle any errors that occurred during the Apex call
                    console.log("error: " + error);
                    clearInterval(this.isQuerying);
                });
        }, 45000); // Query every 5 seconds (adjust as per your requirement)
    }
}