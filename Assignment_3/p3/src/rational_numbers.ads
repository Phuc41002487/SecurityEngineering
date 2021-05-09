-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
package Rational_Numbers is
   type Fraction is private;
   subtype Sign_Type is Integer range -1..1;

   function Create_Fraction(N, D : Integer) return Fraction
     with Pre => D/=0;
   -- Constructor

   function Check_Den(X : Fraction) return Boolean;

   procedure Put(X: Fraction);
   -- Should print "Num / Den" in canonical form with a line break at the end

   function "+"(Lhs : Fraction; Rhs : Fraction) return Fraction
     with Pre => Check_Den(Lhs) and Check_Den(Rhs);
   function "-"(Lhs : Fraction; Rhs : Fraction) return Fraction
     with Pre => Check_Den(Lhs) and Check_Den(Rhs);
   function "*"(Lhs : Fraction; Rhs : Fraction) return Fraction
     with Pre => Check_Den(Lhs) and Check_Den(Rhs);
   function "/"(Lhs : Fraction; Rhs : Fraction) return Fraction
     with Pre => Check_Den(Lhs) and Check_Den(Rhs);
   function "="(Lhs : Fraction; Rhs : Fraction) return Boolean
     with Pre => Check_Den(Lhs) and Check_Den(Rhs);
   function "<"(Lhs : Fraction; Rhs : Fraction) return Boolean
     with Pre => Check_Den(Lhs) and Check_Den(Rhs);
   function ">"(Lhs : Fraction; Rhs : Fraction) return Boolean
     with Pre => Check_Den(Lhs) and Check_Den(Rhs);

   function Sign(X : Fraction) return Sign_Type
     with Pre => Check_Den(X);
   -- returns -1 if X < 0; 0 if X = 0; 1 if X > 0


private

   type Fraction is record
      Num, Den : Integer;
   end record;

end Rational_Numbers;
