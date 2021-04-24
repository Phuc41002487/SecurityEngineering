with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

package body RGB is
   package ATIO renames Ada.Text_IO;
   package AIIO renames Ada.Integer_Text_IO;
   package AFIO renames Ada.Float_Text_IO;

   function Saturation(Item: Integer) return Integer is
   begin
      if Item > 255 then
         return 255;
      elsif Item < 0 then
         return 0;
      else
         return Item;
      end if;
   end Saturation;


   function "+"(Left: Color_RGB; Right: Color_RGB) return Color_RGB is
      Result: Color_RGB;
   begin
      Result.Red := Saturation(Left.Red + Right.Red);
      Result.Green := Saturation(Left.Green + Right.Green);
      Result.Blue := Saturation(Left.Blue + Right.Blue);
      return Result;
   end "+";

   function "-"(Left: Color_RGB; Right: Color_RGB) return Color_RGB is
      Red, Green, Blue: Integer;
      Result: Color_RGB;
   begin
      Red := Saturation(Left.Red - Right.Red);
      Green := Saturation(Left.Green - Right.Green);
      Blue := Saturation(Left.Blue - Right.Blue);
      Result := (Red, Green, Blue);
      return Result;
   end "-";

   function "*"(Left: Color_RGB; Right: Color_RGB) return Color_RGB is
      Result: Color_RGB;
   begin
      Result.Red := Saturation(Left.Red * Right.Red);
      Result.Green := Saturation(Left.Green * Right.Green);
      Result.Blue := Saturation(Left.Blue * Right.Blue);
      return Result;
   end "*";

   -- Convert RGB to HSV
   function RGB_To_HSV(Item: in Color_RGB) return Color_HSV is
      Cmax, Cmin, Diff: Float;
      Red, Green, Blue : Float;
      Result: Color_HSV;
   begin
      -- Convert to Float to improve accuracy
      Red := Float(Item.Red);
      Green := Float(Item.Green);
      Blue := Float(Item.Blue);
      -- maximum and minimum of r, g, b
      Cmax := Float'Max(Red, Green);
      Cmax := Float'Max(Cmax, Blue);
      AFIO.Put(Cmax);
      ATIO.New_Line;
      Cmin := Float'Min(Red, Green);
      Cmin := Float'Min(Cmin, Blue);
      AFIO.Put(Cmin);
      ATIO.New_Line;
      -- Diff between Cmax and Cmin
      Diff := Cmax - Cmin;
      AFIO.Put(Diff);
      ATIO.New_Line;
      -- Compute Hue
      if Diff = 0.0 then
         Result.Hue := 0;
      elsif Cmax = Red then
         Result.Hue := Integer((60.0 * ((Green - Blue) / Diff) + 360.0)) mod 360;
      elsif Cmax = Green then
         Result.Hue := Integer((60.0 * ((Blue - Red) / Diff) + 120.0)) mod 360;
      else
         Result.Hue := Integer((60.0 * ((Red - Green) / Diff) + 240.0)) mod 360;
      end if;
      -- Compute Saturation
      if Cmax = 0.0 then
         Result.Saturation := 0;
      else
         Result.Saturation := Integer(Float(Diff)/Float(Cmax)*100.0);
      end if;
      -- Compute Value
      Result.Value := Integer(Cmax/255.0*100.0);
      return Result;
   end RGB_To_HSV;

   -- Convert RGB to CMYK
   function RGB_To_CMYK(Item: in Color_RGB) return Color_CMYK is
      Red, Green, Blue, Cmax : Float;
      Key, Cyan, Magenta, Yellow: Float;
      Result: Color_CMYK;
   begin
      -- The R,G,B values are divided by 255 to change the range from 0..255 to 0..1:
      Red := Float(Item.Red)/255.0;
      Green := Float(Item.Green)/255.0;
      Blue := Float(Item.Blue)/255.0;
      -- Find maximum value between Red, Green and Blue:
      Cmax := Float'Max(Red, Green);
      Cmax := Float'Max(Cmax, Blue);
      -- The black key color is calculated from the red, green and blue colors
      Key := (1.0-Cmax);
      -- The cyan color is calculated from the red and black Key colors:
      Cyan := (1.0-Red-Key)/(1.0-Key);
      -- The Magenta color is calculated from the green and black Key colors:
      Magenta := (1.0-Green-Key)/(1.0-Key);
      -- The yellow color is calculated from the blue and black Key colors:
      Yellow := (1.0-Blue-Key)/(1.0-Key);
      -- Multiply with 100
      Key := Key*100.0;
      Cyan := Cyan*100.0;
      Magenta := Magenta*100.0;
      Yellow := Yellow*100.0;
      -- Return rounded Integer
      Result := (Integer(Cyan), Integer(Magenta), Integer(Yellow), Integer(Key));
      return Result;
   end RGB_To_CMYK;

   -- Put RGB
   procedure Put(Item: in Color_RGB) is
   begin
      ATIO.Put("(");
      AIIO.Put(Item.Red, Width => 0);
      ATIO.Put(",");
      AIIO.Put(Item.Green, Width => 0);
      ATIO.Put(",");
      AIIO.Put(Item.Blue, Width => 0);
      ATIO.Put(")");
      ATIO.New_Line;
   end Put;

   -- Put HSV
   procedure Put(Item: in Color_HSV) is
   begin
      ATIO.Put("(");
      AIIO.Put(Item.Hue, Width => 0);
      ATIO.Put(",");
      AIIO.Put(Item.Saturation, Width => 0);
      ATIO.Put(",");
      AIIO.Put(Item.Value, Width => 0);
      ATIO.Put(")");
      ATIO.New_Line;
   end Put;

   -- Put CMYK
   procedure Put(Item: in Color_CMYK) is
   begin
      ATIO.Put("(");
      AIIO.Put(Item.Cyan, Width => 0);
      ATIO.Put(",");
      AIIO.Put(Item.Magenta, Width => 0);
      ATIO.Put(",");
      AIIO.Put(Item.Yellow, Width => 0);
      ATIO.Put(",");
      AIIO.Put(Item.Key, Width => 0);
      ATIO.Put(")");
      ATIO.New_Line;
   end Put;

   procedure Test_RGB_To_HSV is
      Left_RGB: Color_RGB;
      Result_HSV: Color_HSV;
   begin
      Left_RGB := (142, 97, 146);
      Result_HSV := RGB_To_HSV(Left_RGB);
      RGB.Put(Result_HSV);
   end Test_RGB_To_HSV;

   procedure Test_Add is
      Left_RGB, Right_RGB: Color_RGB;
      Result_RGB: Color_RGB;
   begin
      Left_RGB := (142, 97, 146);
      Right_RGB := (142, 97, 146);
      Result_RGB := "+"(Left_RGB, Right_RGB);
      RGB.Put(Result_RGB);
   end Test_Add;

   procedure Test_Subtract is
      Left_RGB, Right_RGB: Color_RGB;
      Result_RGB: Color_RGB;
   begin
      Left_RGB := (142, 97, 146);
      Right_RGB := (155, 90, 146);
      Result_RGB := "-"(Left_RGB, Right_RGB);
      RGB.Put(Result_RGB);
   end Test_Subtract;

   procedure Test_Multiply is
      Left_RGB, Right_RGB: Color_RGB;
      Result_RGB: Color_RGB;
   begin
      Left_RGB := (142, 97, 146);
      Right_RGB := (155, 90, 146);
      Result_RGB := "*"(Left_RGB, Right_RGB);
      RGB.Put(Result_RGB);
   end Test_Multiply;

   procedure Test_RGB_To_CMYK is
      Left_RGB: Color_RGB;
      Result_CMYK: Color_CMYK;
   begin
      Left_RGB := (142, 97, 146);
      Result_CMYK := RGB_To_CMYK(Left_RGB);
      RGB.Put(Result_CMYK);
   end Test_RGB_To_CMYK;
end RGB;
