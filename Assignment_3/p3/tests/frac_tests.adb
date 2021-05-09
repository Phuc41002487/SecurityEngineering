-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with AUnit.Assertions;
with Rational_Numbers;

use AUnit.Assertions;
use Rational_Numbers;

package body Frac_Tests is

   procedure Test_Simple_Add (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Lhs, Rhs, Result : Fraction;
   begin
      Lhs := Create_Fraction(3, 4);
      Rhs := Create_Fraction(1, 4);
      Result := Create_Fraction(4, 4);
      Assert (Lhs + Rhs = Result, "Addition is incorrect");
   end Test_Simple_Add;

   procedure Test_Simple_Subtract (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Lhs, Rhs, Result : Fraction;
   begin
      Lhs := Create_Fraction(3, 4);
      Rhs := Create_Fraction(1, 4);
      Result := Create_Fraction(2, 4);
      Assert (Lhs - Rhs = Result, "Subtraction is incorrect");
   end Test_Simple_Subtract;

   procedure Test_Simple_Multiply (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Lhs, Rhs, Result : Fraction;
   begin
      Lhs := Create_Fraction(3, 4);
      Rhs := Create_Fraction(1, 4);
      Result := Create_Fraction(3, 16);
      Assert (Lhs * Rhs = Result, "Multiplying is incorrect");
   end Test_Simple_Multiply;

   procedure Test_Simple_Divide (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Lhs, Rhs, Result : Fraction;
   begin
      Lhs := Create_Fraction(3, 4);
      Rhs := Create_Fraction(1, 4);
      Result := Create_Fraction(12, 4);
      Assert (Lhs / Rhs = Result, "Division is incorrect");
   end Test_Simple_Divide;

   procedure Test_Simple_Equal (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Lhs, Rhs: Fraction;
   begin
      Lhs := Create_Fraction(2, 4);
      Rhs := Create_Fraction(1, 2);
      Assert (Lhs = Rhs, "Equaliser is incorrect");
   end Test_Simple_Equal;

   procedure Test_Simple_Bigger (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Lhs, Rhs: Fraction;
   begin
      Lhs := Create_Fraction(3, 4);
      Rhs := Create_Fraction(1, 4);
      Assert (Lhs > Rhs, "Bigger is incorrect");
   end Test_Simple_Bigger;

   procedure Test_Simple_Smaller (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Lhs, Rhs: Fraction;
   begin
      Lhs := Create_Fraction(1, 4);
      Rhs := Create_Fraction(3, 4);
      Assert (Lhs < Rhs, "Smaller is incorrect");
   end Test_Simple_Smaller;

   procedure Test_Simple_Sign (T: in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Lhs: Fraction;
      Sign: Sign_Type;
   begin
      Lhs := Create_Fraction(1, 4);
      Sign := Rational_Numbers.Sign(Lhs);
      Assert (Sign = 1, "Sign is incorrect");

      Lhs := Create_Fraction(-1, -4);
      Sign := Rational_Numbers.Sign(Lhs);
      Assert (Sign = 1, "Sign is incorrect");

      Lhs := Create_Fraction(-1, 4);
      Sign := Rational_Numbers.Sign(Lhs);
      Assert (Sign = -1, "Sign is incorrect");

      Lhs := Create_Fraction(1, -4);
      Sign := Rational_Numbers.Sign(Lhs);
      Assert (Sign = -1, "Sign is incorrect");

      Lhs := Create_Fraction(0, -4);
      Sign := Rational_Numbers.Sign(Lhs);
      Assert (Sign = 0, "Sign is incorrect");
   end Test_Simple_Sign;

   procedure Register_Tests(T: in out Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine(T, Test_Simple_Add'Access, "Test Addition");
      Register_Routine(T, Test_Simple_Subtract'Access, "Test Substraction");
      Register_Routine(T, Test_Simple_Divide'Access, "Test Division");
      Register_Routine(T, Test_Simple_Multiply'Access, "Test Multiplycation");
      Register_Routine(T, Test_Simple_Equal'Access, "Test Equaliser");
      Register_Routine(T, Test_Simple_Bigger'Access, "Test Bigger");
      Register_Routine(T, Test_Simple_Smaller'Access, "Test Smaller");
      Register_Routine(T, Test_Simple_Sign'Access, "Test Sign");
   end Register_Tests;

   -- ---------------------------------------------------------------

   function Name(T: Test) return Test_String is
      pragma Unreferenced(T);
   begin
      return Format("Vector_Tests");
   end Name;

   -- ---------------------------------------------------------------

end Frac_Tests;
