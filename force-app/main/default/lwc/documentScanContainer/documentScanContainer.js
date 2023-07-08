import { LightningElement, api } from "lwc";

export default class DocumentScanContainer extends LightningElement {
  scanned;
  received;
  submitted = false;
  @api taskid;
  @api documents;

  handleScanAndSplit(event) {
    this.scanned = true;
	 // this.documents = event.detail.documents;	
   this.taskid = event.detail;
   console.log("split container task id: " + this.taskid);
  }

  handleDocumentSubmission(event) {
    console.log("handleDocumentSubmission called");
    this.submitted = true;
    this.scanned = true;
    this.taskid = event.detail;
    console.log("submission container task id: " + this.taskid);
  }

  handleDocumentsReceived(event) {
    console.log("handleDocumentsReceived called");
    this.received = true;
    this.submitted = true;
    this.scanned = true;
    this.taskid = event.detail;
    console.log("received container task id: " + this.taskid);
  }
}