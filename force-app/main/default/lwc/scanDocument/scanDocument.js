import { LightningElement, api } from "lwc";

export default class ScanDocument extends LightningElement {
  @api document;
  editing = false;

  connectedCallback() {}
  handleEditButton() {
    console.log(`congrats you clicked the edit button`);
    this.editing = true;
  }
}