with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Elementary_Functions, Ada.Float_Text_IO;

package body Vectors is
   package AFIO renames Ada.Float_Text_IO;
   package ATIO renames Ada.Text_IO;
   package ANEF renames Ada.Numerics.Elementary_Functions;

   -- Adds two vectors dimension-wise.
   function "+"(Left: Vector; Right: Vector) return Vector is
      Result: Vector;
   begin
      Result.X := Left.X + Right.X;
      Result.Y := Left.Y + Right.Y;
      Result.Z := Left.Z + Right.Z;
      return Result;
   end "+";

   -- Subtracts the right vector from the left one dimension-wise.
   function "-"(Left: Vector; Right: Vector) return Vector is
      Result: Vector;
   begin
      Result.X := Left.X - Right.X;
      Result.Y := Left.Y - Right.Y;
      Result.Z := Left.Z - Right.Z;
      return Result;
   end "-";

   -- Multiplies all dimensions of Left by Right.
   function "*"(Left: Vector; Right: Float) return Vector is
      Result: Vector;
   begin
      Result.X := Left.X * Right;
      Result.Y := Left.Y * Right;
      Result.Z := Left.Z * Right;
      return Result;
   end "*";

   -- Computes the scalar product.
   function "*"(Left: Vector; Right: Vector) return Float is
      Result: Float;
   begin
      Result := (Left.X * Right.X) + (Left.Y * Right.Y) + (Left.Z * Right.Z);
      return Result;
   end "*";

   -- Returns True if all dimensions of Left are equal to that of Right;
   -- Returns False otherwise.
   function "="(Left: Vector; Right: Vector) return Boolean is
   begin
      if (Left.X=Right.X) and (Left.Y=Right.Y) and (Left.Z=Right.Z) then
         return True;
      else
         return False;
      end if;
   end "=";

   -- Determines if both vectors stand orthogonal to each other or not.
   function Are_Orthogonal(Left: Vector; Right: Vector) return Boolean is
      Result: Float;
   begin
      Result := "*"(Left, Right);
      if Result = 0.0 then
         return True;
      else
         return False;
      end if;
   end Are_Orthogonal;

   -- Computes the cross product.
   function Cross_Product(Left: Vector; Right: Vector) return Vector is
      Result: Vector;
   begin
      Result.X := Left.Y*Right.Z - Left.Z*Right.Y;
      Result.Y := Left.Z*Right.X - Left.X*Right.Z;
      Result.Z := Left.X*Right.Y - Left.Y*Right.X;
      return Result;
   end Cross_Product;

   -- Computes the distance between both vectors.
   function Distance(Left: Vector; Right: Vector) return Float is
      Temp_Vector: Vector;
   begin
      Temp_Vector := "-"(Left, Right);
      return ANEF.Sqrt(Temp_Vector.X*Temp_Vector.X
                       + Temp_Vector.Y*Temp_Vector.Y
                       + Temp_Vector.Z*Temp_Vector.Z);
   end Distance;

   -- Computes the distance to the origin of the coordinate system.
   function Distance_To_Origin(Item: Vector) return Float is
      Origin: Vector := (0.0, 0.0, 0.0);
   begin
      return Distance(Item, Origin);
   end Distance_To_Origin;

   -- Prints the vector in the format (X, Y, Z).
   procedure Put(Item: Vector) is
   begin
      ATIO.Put("(");
      AFIO.Put(Item.X);
      ATIO.Put(", ");
      AFIO.Put(Item.Y);
      ATIO.Put(", ");
      AFIO.Put(Item.Z);
      ATIO.Put(")");
      ATIO.New_Line;
   end Put;
end Vectors;
