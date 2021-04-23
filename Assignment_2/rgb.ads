package RGB is
   type Color_RGB is private;
   type Color_HSV is private;  -- has to be defined in private part
   type Color_CMYK is private; -- has to be defined in private part

   -- subtypes for Color_RGB
   subtype Intensity is Integer range 0..255;

   -- define appropriate subtypes for Color_HSV and Color_CMYK
   subtype Degree is Integer range 0..360; 
   subtype Percent is Integer range 0..100; 
   -- [...]

   function "+"(Left: Color_RGB; Right: Color_RGB) return Color_RGB;
   function "-"(Left: Color_RGB; Right: Color_RGB) return Color_RGB;
   function "*"(Left: Color_RGB; Right: Color_RGB) return Intensity; -- dot product

   function RGB_To_HSV(Item: in Color_RGB) return Color_HSV;
   function RGB_To_CMYK(Item: in Color_RGB) return Color_CMYK;

   procedure Put(Item: in Color_RGB);
   procedure Put(Item: in Color_HSV);
   procedure Put(Item: in Color_CMYK);
   procedure Test_RGB_To_HSV;
   procedure Test_Add;
      procedure Test_Subtract;

   private
   type Color_RGB is record
      Red, Green, Blue: Intensity;
   end record;
   
   type Color_HSV is record
      Hue: Degree;
      Saturation, Value: Percent;
   end record;  
   
   type Color_CMYK is record
      Cyan, Magenta, Yellow, Key: Intensity;
   end record; 
end RGB;
    



