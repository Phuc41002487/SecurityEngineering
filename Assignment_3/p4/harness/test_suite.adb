-- Thanh Phuc Vo - 122013
-- Ketan Patel - 121842
with Coffee_Tests;

package body Test_Suite is

    Result: aliased AUnit.Test_Suites.Test_Suite;
    Test: aliased Coffee_Tests.Test;

	function Suite return Access_Test_Suite is
	begin
	    Add_Test(Result'Access, Test'Access);
		return Result'Access;
	end Suite;

end Test_Suite;
