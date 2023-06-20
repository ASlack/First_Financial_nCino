public class RecalculateRelationshipStats implements Schedulable{
    public void execute(SchedulableContext context){
            Database.executeBatch(new LLC_BI.ManualStatisticsBatchUpdater(null), 200);
        }
}