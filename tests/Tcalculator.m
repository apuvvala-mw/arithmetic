classdef Tcalculator < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function one(testCase)
            testCase.verifyEqual(calculate(), -2);
        end
    end

end