trigger BeforeInsertContact on Contact (before insert)
{
    if (Trigger.isBefore && Trigger.isInsert)
    {
        BeforeInsertContactTriggerHandler.TriggerHandler(Trigger.new);
    }
}