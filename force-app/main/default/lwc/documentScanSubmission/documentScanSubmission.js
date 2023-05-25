import { LightningElement } from "lwc";
import queryLoans from "@salesforce/apex/DocumentScanController.queryLoans";

export default class DocumentScanSubmission extends LightningElement {
  loanNumber;
  matchingLoans;
  matchingLoanOptions = [];
  matchingLoansMessage;
  actionMessage;
  selectedLoan;

  get acceptedFormats() {
    return [".pdf"];
  }

  // renderedCallback() {
  //   console.log(`rendered callback`);
  //   this.partialReset();
  // }

  handleLoanNumberInputBlur(event) {
    // this.partialReset();
    console.log(`blur`);
    this.loanNumber = event.target.value;

    if (this.loanNumber.length > 0) {
      queryLoans({ loanNumber: this.loanNumber })
        .then((result) => {
          console.log(result);
          // TODO: temporarily make another loan have a loan number of 54601464
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
  }

  reset() {
    this.partialReset();

    this.loanNumber = undefined;
    this.matchingLoansMessage = undefined;
    this.actionMessage = undefined;
  }

  handleLoanRadioGroupChange(event) {
    // console.log(`changed to: `);
    // console.log(JSON.stringify(event.target.value));
    this.selectedLoan = event.target.value;
  }

  handleResetButton() {
    this.reset();
  }

  processMatchingLoans() {
    this.matchingLoans.forEach((loan) => {
      // console.log(loan);
      this.matchingLoanOptions.push({
        label: loan.Name,
        value: loan.Id
      });
    });
  }

  handleFileUploadFinished(event) {
    console.log(`upload finished`);
    console.log(event.target.value);
  }
}