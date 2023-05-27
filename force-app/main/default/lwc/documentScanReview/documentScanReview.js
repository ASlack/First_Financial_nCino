import { LightningElement } from "lwc";

const docs = [
  {
    fileName: "FFBI-522 AC",
    thumbnail: "https://i.imgur.com/bjKycDt.jpg"
  },
  {
    fileName: "FFBI-522 Solution",
    thumbnail: "https://i.imgur.com/5OcuxJo.jpg"
  },
  {
    fileName: "FFBI-522 Deployment Checklist",
    thumbnail: "https://i.imgur.com/qvj5rsT.jpg"
  },

  {
    fileName: "Platform Developer II Purchase Confirmation",
    thumbnail: "https://i.imgur.com/HjAgS5a.png"
  },
  {
    fileName: "JavaScript Developer I Purchase Confirmation",
    thumbnail: "https://i.imgur.com/R7MIMqp.png"
  }
];

export default class DocumentScanReview extends LightningElement {
  documents;
  connectedCallback() {
    this.documents = docs;
  }
}