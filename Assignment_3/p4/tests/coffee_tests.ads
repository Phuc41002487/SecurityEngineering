-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with AUnit;
with AUnit.Test_Cases;

use AUnit;
use AUnit.Test_Cases;

package Coffee_Tests is
	
	type Test is new Test_Case with null record;
	
	procedure Register_Tests(T: in out Test);
   function Name(T: Test) return Test_String;
   
   procedure Test_Initialize(T : in out Test_Cases.Test_Case'Class);
   procedure Test_Input(T : in out Test_Cases.Test_Case'Class);

end Coffee_Tests;
