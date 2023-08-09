public with sharing class QueryController {
    public List<Account> QueryController() 
    {
        List<Account> newAccounts = [SELECT Name, AccountNumber, Owner.Email, AnnualRevenue FROM Account WHERE CreatedDate = THIS_MONTH];
        for( Account acc : newAccounts)
        {
            if(acc.AnnualRevenue >= 1000000)
            {
                newAccounts.add(acc);
            }
        }
        return newAccounts;

    }
}