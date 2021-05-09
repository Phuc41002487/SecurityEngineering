-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with Ada.Integer_Text_IO, Ada.Text_IO;

package body Rational_Numbers is
   package AIIO renames Ada.Integer_Text_IO;
   package ATIO renames Ada.Text_IO;

   -- Constructor
   function Create_Fraction(N, D : Integer) return Fraction is
      Result: Fraction;
   begin
      Result.Num := N;
      Result.Den := D;
      return Result;
   end Create_Fraction;

   function Check_Den(X : Fraction) return Boolean is
   begin
      return X.Den /= 0;
   end Check_Den;

   function "+"(Lhs : Fraction; Rhs : Fraction) return Fraction is
      Result: Fraction;
   begin
      Result.Den := Lhs.Den*Rhs.Den;
      Result.Num := Lhs.Num*Rhs.Den + Rhs.Num*Lhs.Den;
      return Result;
   end "+";

   function "-"(Lhs : Fraction; Rhs : Fraction) return Fraction is
      Result: Fraction;
   begin
      Result.Den := Lhs.Den*Rhs.Den;
      Result.Num := Lhs.Num*Rhs.Den - Rhs.Num*Lhs.Den;
      return Result;
   end "-";

   function "*"(Lhs : Fraction; Rhs : Fraction) return Fraction is
      Result: Fraction;
   begin
      Result.Den := Lhs.Den*Rhs.Den;
      Result.Num := Lhs.Num*Rhs.Num;
      return Result;
   end "*";

   function "/"(Lhs : Fraction; Rhs : Fraction) return Fraction is
      Result: Fraction;
   begin
      Result.Num := Lhs.Num*Rhs.Den;
      Result.Den := Lhs.Den*Rhs.Num;
      return Result;
   end "/";

   function "="(Lhs : Fraction; Rhs : Fraction) return Boolean is
   begin
      if Lhs.Num*Rhs.Den = Rhs.Num*Lhs.Den then
         return True;
      else
         return False;
      end if;
   end "=";

   function "<"(Lhs : Fraction; Rhs : Fraction) return Boolean is
   begin
      if Lhs.Num*Rhs.Den < Rhs.Num*Lhs.Den then
         return True;
      else
         return False;
      end if;
   end "<";

   function ">"(Lhs : Fraction; Rhs : Fraction) return Boolean is
   begin
      if Lhs.Num*Rhs.Den > Rhs.Num*Lhs.Den then
         return True;
      else
         return False;
      end if;
   end ">";

   -- returns -1 if X < 0; 0 if X = 0; 1 if X > 0
   function Sign(X : Fraction) return Sign_Type is
   begin
      if X.Num = 0 then
         return 0;
      elsif (X.Num > 0 and X.Den > 0) or (X.Num < 0 and X.Den < 0) then
         return 1;
      else
         return -1;
      end if;
   end Sign;

   -- Put Procedure
   procedure Put(X: Fraction) is
   begin
      AIIO.Put(X.Num, Width => 0);
      ATIO.Put("/");
      AIIO.Put(X.Den, Width => 0);
   end Put;

end Rational_Numbers;
