-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
package Coffee_Machine is

	-- Simulation of a coin-driven coffee machine
	-- User: - One slot to insert coins (only 10 or 20 cents)
	--		 - One button to press ("money back")
	-- Machine: one slot to drop coins, the coffee output
	-- Given 30 cents or more, the coffee is produced immediately
	-- (Note that Overspending is Possible)

	type State is private;
	type Action is (Ten_Cent, Twenty_Cent, Button);
   type Reaction is (Nothing, Drop_All_Coins, Coffee);
   
   function Is_Zero_State(S : State) return Boolean;
   function Is_Valid(S : State) return Boolean;
   function Is_Valid(Act : Action) return Boolean;
   function Is_Valid(R : Reaction) return Boolean;

   procedure Initialize (S : out State) with 
     Post => Is_Zero_State(S);
	procedure Input(S 	: in out State;
                 Act 	: in Action;
                 React 	: out Reaction) with 
     Pre => Is_Valid(S) and Is_Valid(Act),
     Post => Is_Valid(S) and Is_Valid(React);
    
	private
		type State is range 0..2;		

end Coffee_Machine;
