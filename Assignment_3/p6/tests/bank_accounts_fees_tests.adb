-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with AUnit.Assertions;
with Bank_Accounts;
with Bank_Accounts.Fees;

use AUnit.Assertions;
use Bank_Accounts;
use Bank_Accounts.Fees;

package body Bank_Accounts_Fees_Tests is

   --package One_Euro_Fees_Accounts is new Bank_Accounts.Fees(100);
   --use One_Euro_Fees_Accounts;

   procedure Test_Witdrawal (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Account: Account_Type;
      Old_Balance: Cents_Type;
      Amount: Cents_Type;
   begin
      Deposit(Account, 500);
      Old_Balance := Account.Get_Balance;
      Amount := 400;
      Bank_Accounts.Fees.Withdraw(Account, Amount);
      if not Assert (Account.Get_Balance = Old_Balance - Amount - One_Euro_Fees, "Witdrawal is incorrect") then
         Put(Account);
      end if;
   end Test_Witdrawal;

   procedure Test_Transfer (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      From, To: Account_Type;
      From_Old_Balance, To_Old_Balance: Cents_Type;
      Amount: Cents_Type;
   begin
      Deposit(From, 500);
      From_Old_Balance := From.Get_Balance;
      To_Old_Balance := To.Get_Balance;
      Amount := 400;
      Bank_Accounts.Fees.Transfer(From, To, Amount);
      -- check From Balance after transfer
      if not Assert (From.Get_Balance = From_Old_Balance - Amount - One_Euro_Fees, "Transfer is incorrect") then
         Put(From);
      end if;
      -- check To Balance after transfer
      if not Assert (To.Get_Balance = To_Old_Balance + Amount, "Transfer is incorrect") then
         Put(To);
      end if;
   end Test_Transfer;

   procedure Register_Tests(T: in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine(T, Test_Witdrawal'Access, "Test Witdrawal with One Euro Fee");
      Register_Routine(T, Test_Transfer'Access, "Test Transfer with One Euro Fee");
   end Register_Tests;

   -- -----------------------------------------------------

   function Name(T: Test) return Test_String is
      pragma Unreferenced(T);
   begin
      return Format("Bank_Accounts_Fees_Tests");
   end Name;

   -- -----------------------------------------------------

end Bank_Accounts_Fees_Tests;
