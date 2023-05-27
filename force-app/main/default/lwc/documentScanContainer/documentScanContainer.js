import { LightningElement } from "lwc";

export default class DocumentScanContainer extends LightningElement {
  scanned;

  handleScanAndSplit() {
    console.log(`in scan and split`);
    this.scanned = true;
  }
}