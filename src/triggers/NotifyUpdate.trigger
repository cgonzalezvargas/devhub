/**
 * Created by abaddon on 9/27/22.
 */

trigger NotifyUpdate on Employee__c (after update)
{
    for(Employee__c objEmployee: Trigger.New)
    {


    }

}