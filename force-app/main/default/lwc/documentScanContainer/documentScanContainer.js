import { LightningElement, api } from "lwc";

export default class DocumentScanContainer extends LightningElement {
  scanned;
  received;
  submitted = false;
  @api taskid;
  @api documents;

  handleScanAndSplit(event) {
    this.scanned = true;
   this.taskid = event.detail;
  }

  handleDocumentSubmission(event) {
    this.submitted = true;
    this.scanned = true;
    this.taskid = event.detail;
  }

  handleDocumentsReceived(event) {
    this.received = true;
    this.submitted = false;
    this.scanned = true;
    this.documents = event.detail;
  }
}