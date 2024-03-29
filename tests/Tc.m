classdef Tc < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function add(testCase)
            testCase.verifyEqual(calculate(), 2);
        end
    end

end