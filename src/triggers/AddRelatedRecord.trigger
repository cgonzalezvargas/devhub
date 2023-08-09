/**
 * Created by abaddon on 10/7/22.
 */

trigger AddRelatedRecord on Account (after insert, after update)
{

    List<Opportunity> oppList = new List<Opportunity>();

    //Get the related opportunities for the accounts in this trigger

    Map<Id,Account> acctsWithOpps = new Map<Id,Account>([SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN : Trigger.New]);

    //Add an opportunnity for each account if it doesnt already have one.
    //Iterate through each account.

    for(Account a: Trigger.New)
    {
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
        //Check if the account already has a related opportunity.
        //
        if(acctsWithOpps.get(a.Id).Opportunities.size()==0)
        {
            //If it doesnt add a default opportunnity
            //
            oppList.add(new Opportunity(Name=a.Name + 'Opportunnity',StageName='Prospecting', CloseDate=System.today().addMonths(1),AccountId=a.Id));
        }

    }
    if(oppList.size()>0)
    {
        insert oppList;
    }

}