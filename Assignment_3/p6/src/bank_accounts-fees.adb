-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
package body Bank_Accounts.Fees is

  procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance - Amount - One_Euro_Fees;
   end Withdraw;

   procedure Transfer(From: in out Account_Type;
                      To: in out Account_Type;
                      Amount: Cents_Type) is
   begin
      From.Balance := From.Balance - Amount - One_Euro_Fees;
      To.Balance := To.Balance + Amount;
   end Transfer;

end Bank_Accounts.Fees;
