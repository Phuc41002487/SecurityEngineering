with RGB, Ada.Text_IO;

procedure Main is
   package ATIO renames Ada.Text_IO;
   Left_Color_RGB: RGB.Color_RGB;
   Left_Color_HSV: RGB.Color_HSV;
begin
   ATIO.Put_Line("Hello");
   Left_Color_RGB := RGB.RGB_Constructor(255, 255, 255);
   RGB.Put(Left_Color_RGB);
   Left_Color_HSV := RGB.RGB_To_HSV(Left_Color_RGB);
   RGB.Put(Left_Color_HSV);
end Main;
