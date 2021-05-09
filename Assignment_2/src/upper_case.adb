-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;
procedure upper_case is
   package ACHH renames Ada.Characters.Handling;
   package ATIO renames Ada.Text_IO;
   package AIIO renames Ada.Integer_Text_IO;
   Char : Character;
begin
   ATIO.Get(Char);
   if ACHH.Is_Lower(Char) then
      ATIO.Put_Line("Lower case, convert to upper case");
      ATIO.Put(ACHH.To_Upper(Char));
   else
      ATIO.Put_Line("Upper case, do nothing");
      ATIO.Put(Char);
   end if;
end upper_case;
