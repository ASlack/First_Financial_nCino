import { LightningElement, api } from "lwc";

export default class DocumentTitle extends LightningElement {
  @api document;
  editing = false;

  toggleEdit() {
    this.editing = !this.editing;
  }
}