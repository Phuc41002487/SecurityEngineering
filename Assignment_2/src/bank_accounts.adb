-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, System.Assertions, Ada.Exceptions;

package body Bank_Accounts is
   package ATIO renames Ada.Text_IO;
   package AIIO renames Ada.Integer_Text_IO;
   package AFIO renames Ada.Float_Text_IO;
   package SYSASSERT renames System.Assertions;
   package AEXC renames Ada.Exceptions;
        
   function Get_Balance(Account: Account_Type) return Cents_Type is
      Result: Cents_Type;
   begin
      Result := Account.Balance;
      return Result;
   end Get_Balance;    

   procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance + Amount;
   end Deposit;
    
   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance - Amount;
   exception
      when SYSASSERT.Assert_Failure =>
         ATIO.Put_Line("You cannot withdraw more than your currrent balance");
   end Withdraw;

   procedure Transfer(From: in out Account_Type;
                      To: in out Account_Type; 
                      Amount: in Cents_Type) is
   begin
      From.Balance := From.Balance - Amount;
      To.Balance := To.Balance + Amount;
   end Transfer;

end Bank_Accounts;
