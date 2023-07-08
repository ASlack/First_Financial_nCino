import { LightningElement,api } from 'lwc';

export default class Test extends LightningElement {
    @api taskId;
    data;
    isQuerying = false;

    connectedCallback() {
        console.log("connectedCallback called");
        console.log("task id: " + this.taskId);
    }
}