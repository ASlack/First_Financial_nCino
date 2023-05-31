import { LightningElement } from "lwc";
import queryLoans from "@salesforce/apex/DocumentScanController.queryLoans";

export default class DocumentScanSubmission extends LightningElement {
  loanNumber;
  matchingLoans;
  matchingLoanOptions = [];
  matchingLoansMessage;
  actionMessage;
  selectedLoan;
  fileUploaded;

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
  }

  handleScanAndSplitButton() {
    const scanAndSplitEvent = new CustomEvent("scanandsplit");
    this.dispatchEvent(scanAndSplitEvent);
  }
}