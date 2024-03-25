classdef T2 < matlab.unittest.TestCase

    methods (Test)
        function s_multiply_doubles(testCase)
            testCase.verifyEqual(s_multiply(1,1), 1);
        end
    end
    
end