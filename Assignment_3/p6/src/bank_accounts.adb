-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with Ada.Integer_Text_IO;

package body Bank_Accounts is
   package AIIO renames Ada.Integer_Text_IO;

   function Get_Balance(Account: Account_Type) return Cents_Type is
   begin
      return Account.Balance;
   end Get_Balance;
   -- Returns the current Balance from Account.

   procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance + Amount;
   end Deposit;

   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance - Amount;
   end Withdraw;

   procedure Transfer(From: in out Account_Type;
                      To: in out Account_Type;
                      Amount: Cents_Type) is
   begin
      From.Balance := From.Balance - Amount;
      To.Balance := To.Balance + Amount;
   end Transfer;

   procedure Put(Account: in Account_Type) is
   begin
      AIIO.Put(Account.Balance);
   end Put;
   -- Prints the current Balance of the given Account.

end Bank_Accounts;
