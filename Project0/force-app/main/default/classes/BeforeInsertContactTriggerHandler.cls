public class BeforeInsertContactTriggerHandler
{
    public static void TriggerHandler(List<Contact> trigCon)
    {
        List<Account> accList = [SELECT Name, Phone FROM Account];
    
    	/* Loop Through Created Contacts */
		for (Contact con : trigCon)
   		{
        	/* Check If Contact Has Account */
        	if (con.AccountId == null)
    		{
            	/* Loop Through All Accounts */
        		for (Account acc : accList)
            	{
                	/* Check If Contact Name and Phone Matches Account */
                	if (con.LastName == acc.Name && con.Phone == acc.Phone)
                	{
                    	/* Relate Account to Contact */
                    	con.AccountId = acc.Id;
                	}
            	}
    		}
    	}
    }
}