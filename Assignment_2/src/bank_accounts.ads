-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
pragma Assertion_Policy (Check);

package Bank_Accounts is
   subtype Cents_Type is Integer;
   type Account_Type is record
      Balance: Cents_Type := 0;
   end record;
   
   Deposit_Lmt: Cents_Type := 1000000;
    
   function Get_Balance(Account: Account_Type) return Cents_Type;
   -- Returns the current Balance from Account.
   
   -- Deposits Amount at the given Account.
   procedure Deposit(Account: in out Account_Type; Amount: Cents_Type)
     with Pre => Deposit_Lmt >= Amount;   
   
   -- Withdraws Amount from the given Account.
   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type)
     with Post => Account.Balance >= 0;
   
   -- Transfers Amount from Account From to Account To.
   procedure Transfer(From: in out Account_Type; 
                       To: in out Account_Type; 
                       Amount: in Cents_Type)
     with Pre => From.Balance > Amount;
end Bank_Accounts;
