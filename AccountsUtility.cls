public class AccountsUtility 
{
  public boolean isAccountExistByName(string AccountName)
  {
    integer recordsCount = [Select count() from Account where name =: AccountName];
     if(recordsCount>0)
         return true ;
      else
          return false ;
  }
    
  public boolean isAccountExistByID(Id AccountId)
  {
    integer recordsCount = [Select count() from Account where Id =: AccountId];
      if(recordsCount>0)
         return true ;
      else 
          return false ;
  }
    
  public Id CreateAccount(string acctName,string acctIndustry,string acctRating)
  {
    Boolean checkDuplicate = isAccountExistByName(acctName);
     
    if(CheckDuplicate)
    {
       System.debug('Duplicate Account found');
       return null;
    }
     else
     {
       Account a = new Account();
       a.name = acctName ;
       a.Industry = acctIndustry ;
       a.rating = acctRating ;
         
       insert a ;
       return a.Id ;
     }
  }
}