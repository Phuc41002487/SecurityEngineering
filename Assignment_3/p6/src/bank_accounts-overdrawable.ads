-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
package Bank_Accounts.Overdrawable is

   Over_Draw_Limit: constant Cents_Type := 100;

   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type)
     with Pre => Account.Get_Balance + Over_Draw_Limit >= Amount and Amount > 0,
     Post => Account.Get_Balance = Account.Get_Balance'Old - Amount;

end Bank_Accounts.Overdrawable;
