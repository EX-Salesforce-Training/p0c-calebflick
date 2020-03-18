trigger BeforeInsertAccount on Account (before insert)
{
    if (Trigger.isBefore && Trigger.isInsert)
    {
        BeforeInsertAccountTriggerHandler.TriggerHandler(Trigger.new);
    }
}