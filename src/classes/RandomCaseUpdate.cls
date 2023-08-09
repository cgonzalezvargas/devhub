/**
 * Created by abaddon on 9/21/22.
 */

public with sharing class RandomCaseUpdate
{
    public void viewCases(String searchStr, String blurbText)
    {
        List<Case> updatedCase = new List<Case>();
        List<Case> listCases = [SELECT Subject, Origin, CaseNumber, Account.AccountNumber FROM Case WHERE Origin=:searchStr];
        for(Case cas : listCases )
        {
            cas.Description = blurbText;
            updatedCase.add(cas);

        }
        if(updatedCase.size() != 0)
        {
            update updatedCase;
        }

    }

}