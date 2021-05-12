-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with AUnit.Assertions;
with Bank_Accounts;
with Bank_Accounts.Overdrawable;

use AUnit.Assertions;
use Bank_Accounts;

package body Bank_Accounts_Overdrawable_Tests is

   procedure Test_Witdrawal (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Account: Account_Type;
      Old_Balance: Cents_Type;
      Amount: Cents_Type;
   begin
      Deposit(Account, 500);
      Old_Balance := Account.Get_Balance;
      Amount := 600;
      Bank_Accounts.Overdrawable.Withdraw(Account, Amount);
      if not Assert (Account.Get_Balance = Old_Balance - Amount, "Witdrawal is incorrect") then
         Put(Account);
      end if;
   end Test_Witdrawal;

   procedure Register_Tests(T: in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine(T, Test_Witdrawal'Access, "Test Witdrawal with over Draw limit 100");
   end Register_Tests;

   -- -----------------------------------------------------

   function Name(T: Test) return Test_String is
      pragma Unreferenced(T);
   begin
      return Format("Bank_Accounts_Overdrawable_Tests");
   end Name;

   -- -----------------------------------------------------
end Bank_Accounts_Overdrawable_Tests;
