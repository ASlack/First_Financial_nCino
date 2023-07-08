import { LightningElement } from "lwc";
import queryLoans from "@salesforce/apex/DocumentScanController.queryLoans";
import parseDocument from "@salesforce/apex/DocumentScanController.parseDocument";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class DocumentScanSubmission extends LightningElement {
  loanNumber;
  matchingLoans;
  matchingLoanOptions = [];
  matchingLoansMessage;
  actionMessage;
  selectedLoan;
  fileUploaded;
  documentId;
  loandId;
  isLoading = false;
  taskid;

  get acceptedFormats() {
    return [".pdf"];
  }

  handleLoanNumberInputBlur(event) {
    this.loanNumber = event.target.value;

    if (this.loanNumber.length > 0) {
      queryLoans({ loanNumber: this.loanNumber })
        .then((result) => {
          this.matchingLoansMessage = `found ${result.length} loan(s) that matched ${this.loanNumber}`;
          if (result.length) {
            this.matchingLoans = result;
            this.matchingLoanOptions = [];
            this.processMatchingLoans();
            this.actionMessage = `Please select a loan`;
          } else {
            this.actionMessage = `Please enter a different loan number`;
            this.partialReset();
          }
        })
        .catch((error) => {
          console.log(error);
        });
    } else {
      this.partialReset();
    }
  }

  partialReset() {
    this.matchingLoans = undefined;
    this.matchingLoanOptions = [];
    this.selectedLoan = undefined;
    this.fileUploaded = undefined;
  }

  reset() {
    this.partialReset();

    this.loanNumber = undefined;
    this.matchingLoansMessage = undefined;
    this.actionMessage = undefined;
  }

  handleLoanRadioGroupChange(event) {
    this.selectedLoan = event.target.value;
  }

  handleResetButton() {
    this.reset();
  }

  processMatchingLoans() {
    this.matchingLoans.forEach((loan) => {
      this.matchingLoanOptions.push({
        label: loan.Name,
        value: loan.Id
      });
    });
  }

  handleUploadFinished(event) {
    this.fileUploaded = event.detail.files[0];
    this.documentId = this.fileUploaded.contentVersionId;
    this.loanId = this.matchingLoans[0].Id;
  }

  handleScanAndSplitButton() {
    this.isLoading = true;

    parseDocument({ loanNumber: this.loanId, documentId: this.documentId })
      .then((result) => {
        this.taskid = result;
      })
      .catch((error) => {
        console.log(error);
    });

    setTimeout(() => { 
      const toastEvent = new ShowToastEvent({
        title: "Success!", 
        message: `Document has been submitted for processing.`,
        variant: "success",
        mode: "dismissable",
      });
  
      this.dispatchEvent(toastEvent);
      
      const submitEvent = new CustomEvent('scansubmission', {
        detail: this.taskid
      });
  
      this.dispatchEvent(submitEvent);
  
      this.isLoading = false;
      
    }, 3000);

  }
}

``