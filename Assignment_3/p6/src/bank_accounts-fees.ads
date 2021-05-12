-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
package Bank_Accounts.Fees is

   One_Euro_Fees: constant Cents_Type := 1;

   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type)
     with Pre => Account.Get_Balance >= (Amount + One_Euro_Fees) and Amount > 0,
     Post => Account.Get_Balance = Account.Get_Balance'Old - Amount - One_Euro_Fees;

   procedure Transfer(From: in out Account_Type;
                      To: in out Account_Type;
                      Amount: Cents_Type)
     with Pre => From.Get_Balance >= (Amount + One_Euro_Fees) and Amount > 0,
     Post => From.Get_Balance = From.Get_Balance'Old - Amount - One_Euro_Fees and
     To.Get_Balance = To.Get_Balance'Old + Amount;

end Bank_Accounts.Fees;
