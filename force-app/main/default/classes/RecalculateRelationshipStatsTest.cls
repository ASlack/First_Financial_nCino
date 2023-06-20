@isTest
private class RecalculateRelationshipStatsTest
{
    @isTest
    static void driver()
    {
        String cronExpr = '0 0 0 15 3 ? 2030';
        
        Test.startTest();
        RecalculateRelationshipStats rrs = new RecalculateRelationshipStats();
        String jobId = System.schedule('LLC_BI.ManualStatisticsBatchUpdater', cronExpr, rrs);
        rrs.execute(null);
        Test.stopTest();
    }
}