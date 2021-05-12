-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
package body Bank_Accounts.Overdrawable is

   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance - Amount;
   end Withdraw;

end Bank_Accounts.Overdrawable;
