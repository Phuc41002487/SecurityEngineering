-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with AUnit.Assertions;
with Coffee_Machine;

package body Coffee_Tests is
    use AUnit.Assertions;
    use Coffee_Machine;

   procedure Register_Tests(T: in out Test) is
        use AUnit.Test_Cases.Registration;
   begin
      Register_Routine(T, Test_Initialize'Access, "Test Initialize");
      Register_Routine(T, Test_Input'Access, "Test Input: 0 -> 10 -> 10 -> Button -> 10 -> 20 -> 10 -> Button -> Button -> 20 -> 10 -> 20 -> 20");
   end Register_Tests;

    -- ---------------------------------------------------------------

   function Name(T: Test) return Test_String is
       pragma Unreferenced(T);
   begin
       return Format("Coffee_Machine_Tests");
   end Name;

   -- ---------------------------------------------------------------

   procedure Test_Initialize(T : in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced(T);
      S : State;
   begin
      Initialize(S);
      Assert (Is_Zero_State(S), "State not initialized to zero");
   end Test_Initialize;

   procedure Test_Input(T : in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced(T);
      S : State;
      Act : Action;
      React : Reaction;
   begin
      -- Start at zero
      Initialize(S);

      -- Add 10 cents
      Act := Ten_Cent;
      Input(S, Act, React);
      Assert(React = Nothing, "State : 0, Action : Ten_Cent, Expected Reaction : Nothing, Found : " & React'Image);

      -- Add 10 cents
      Act := Ten_Cent;
      Input(S, Act, React);
      Assert(React = Nothing, "State : 1, Action : Ten_Cent, Expected Reaction : Nothing, Found : " & React'Image);

      -- Button
      Act := Button;
      Input (S, Act, React);
      Assert (React = Drop_All_Coins, "State : 2, Action : Button, Expected Reaction : Drop_All_Coins, Found : " & React'Image);

      -- Add 10 cents
      Act := Ten_Cent;
      Input(S, Act, React);
      Assert(React = Nothing, "State : 0, Action : Ten_Cent, Expected Reaction : Nothing, Found : " & React'Image);

      -- Add 20 cents
      Act := Twenty_Cent;
      Input(S, Act, React);
      Assert(React = Coffee, "State : 1, Action : Twenty_Cent, Expected Reaction : Coffee, Found : " & React'Image);

      -- Add 10 cents
      Act := Ten_Cent;
      Input(S, Act, React);
      Assert(React = Nothing, "State : 0, Action : Ten_Cent, Expected Reaction : Nothing, Found : " & React'Image);

      -- Button
      Act := Button;
      Input(S, Act, React);
      Assert(React = Drop_All_Coins, "State : 1, Action : Button, Expected Reaction : Drop_All_Coins, Found : " & React'Image);

      -- Button
      Act := Button;
      Input(S, Act, React);
      Assert(React = Drop_All_Coins, "State : 0, Action : Button, Expected Reaction : Drop_All_Coins, Found : " & React'Image);

      -- Add 20 cents
      Act := Twenty_Cent;
      Input(S, Act, React);
      Assert(React = Nothing, "State : 0, Action : Twenty_Cent, Expected Reaction : Nothing, Found : " & React'Image);

      -- Add 10 cents
      Act := Ten_Cent;
      Input(S, Act, React);
      Assert(React = Coffee, "State : 2, Action : Ten_Cent, Expected Reaction : Coffee, Found : " & React'Image);

      -- Add 20 cents
      Act := Twenty_Cent;
      Input(S, Act, React);
      Assert(React = Nothing, "State : 0, Action : Twenty_Cent, Expected Reaction : Nothing, Found : " & React'Image);

      -- Add 20 cents
      Act := Twenty_Cent;
      Input(S, Act, React);
      Assert(React = Coffee, "State : 2, Action : Twenty_Cent, Expected Reaction : Coffee, Found : " & React'Image);

   end Test_Input;

end Coffee_Tests;
