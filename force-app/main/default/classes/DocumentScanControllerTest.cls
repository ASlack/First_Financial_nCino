@isTest
private class DocumentScanControllerTest {
  @TestSetup
  static void makeData() {
    //* Create loans
    List<LLC_BI__Loan__c> testLoans = new List<LLC_BI__Loan__c>();

    LLC_BI__Loan__c testLoan = new LLC_BI__Loan__c();
    testLoan.Name = 'test loan 1';
    testLoan.LLC_BI__lookupKey__c = '1234';
    testLoans.add(testLoan);

    insert testLoans;
  }

  @isTest
  static void testQueryLoans() {
    System.debug('hello');
    List<LLC_BI__Loan__c> matchingLoans = DocumentScanController.queryLoans(
      '1234'
    );
    System.assertNotEquals(0, matchingLoans.size());
  }
}