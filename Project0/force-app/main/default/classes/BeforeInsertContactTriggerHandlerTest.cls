@isTest
public class BeforeInsertContactTriggerHandlerTest
{
	@isTest
    public static void TriggerHandlerTest()
    {
        /* Test Trigger Handler */
        System.Test.startTest();
        
        Account acc = new Account();
        acc.Name = 'Last';
        acc.Phone = '(111) 111-1111';        
        
        Contact con = new Contact();
        con.LastName = 'Last';
        con.Phone = '(111) 111-1111';
        
        insert acc;
        insert con;	//trigger should execute after insert, making con.AccountId == acc.Id
        
        Account a = [SELECT Name, Phone, Id FROM Account WHERE Id =: acc.Id];
        Contact c = [SELECT LastName, Phone, AccountId FROM Contact WHERE Id =: con.Id];
        
        //System.debug(a);
        //System.debug(c);
        
        System.assertEquals(a.Id, c.AccountId);
        System.assertNotEquals(a.Id, null);
        
        System.Test.stopTest();
    }
}