-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
package body Coffee_Machine is

   procedure Initialize (S : out State) is
   begin
      S := 0;
   end Initialize;

   procedure Input (S : in out State; Act : in Action; React : out Reaction) is
   begin
      if S = 0 then
         if Act = Ten_Cent then
            S := 1;
            React := Nothing;
         elsif Act = Twenty_Cent then
            S := 2;
            React := Nothing;
         else
            S := 0;
            React := Drop_All_Coins;
         end if;
      elsif S = 1 then
         if Act = Ten_Cent then
            S := 2;
            React := Nothing;
         elsif Act = Twenty_Cent then
            S := 0;
            React := Coffee;
         else
            S := 0;
            React := Drop_All_Coins;
         end if;
      else
         if Act = Ten_Cent then
            S := 0;
            React := Coffee;
         elsif Act = Twenty_Cent then
            S := 0;
            React := Coffee;
         else
            S := 0;
            React := Drop_All_Coins;
         end if;
      end if;
   end Input;

   function Is_Zero_State(S : State) return Boolean is
   begin
      return S = 0;
   end Is_Zero_State;

   function Is_Valid(S : in State) return Boolean is
   begin
      return (S = 0 or S = 1 or S = 2);
   end Is_Valid;

   function Is_Valid(Act : Action) return Boolean is
   begin
      return (Act = Ten_Cent or Act = Twenty_Cent or Act = Button);
   end Is_Valid;

   function Is_Valid(R : in Reaction) return Boolean is
   begin
      return (R = Nothing or R = Drop_All_Coins or R = Coffee);
   end Is_Valid;

end Coffee_Machine;
