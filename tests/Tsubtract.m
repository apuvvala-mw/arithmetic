classdef Tsubtract < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function positive(testCase)
            testCase.verifyEqual(s_subtract(1,0), 1);
        end
    end

end