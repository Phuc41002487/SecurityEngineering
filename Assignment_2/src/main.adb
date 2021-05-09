with RGB, Ada.Text_IO;

procedure Main is
   package ATIO renames Ada.Text_IO;
   Left_Color_RGB: RGB.Color_RGB;
   Left_Color_HSV: RGB.Color_HSV;
   Left_Color_CMYK: RGB.Color_CMYK;
   Right_Color_RGB: RGB.Color_RGB;
   Result_Color_RGB: RGB.Color_RGB;
begin
   ATIO.Put_Line("Hello");

   Left_Color_RGB := RGB.RGB_Constructor(152, 3, 150);
   Right_Color_RGB := RGB.RGB_Constructor(142, 42, 155);

   Result_Color_RGB := RGB."+"(Left_Color_RGB, Right_Color_RGB);
   RGB.Put(Result_Color_RGB);

   Result_Color_RGB := RGB."-"(Left_Color_RGB, Right_Color_RGB);
   RGB.Put(Result_Color_RGB);

   Result_Color_RGB := RGB."*"(Left_Color_RGB, Right_Color_RGB);
   RGB.Put(Result_Color_RGB);


   Left_Color_HSV := RGB.RGB_To_HSV(Left_Color_RGB);
   RGB.Put(Left_Color_HSV);

   Left_Color_CMYK := RGB.RGB_To_CMYK(Left_Color_RGB);
   RGB.Put(Left_Color_CMYK);
end Main;
