import { LightningElement, api } from "lwc";

export default class DocumentScanContainer extends LightningElement {
  scanned;
  @api documents;

  handleScanAndSplit(event) {
    this.scanned = true;
	this.documents = event.detail.documents;	
  }
}