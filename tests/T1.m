classdef T1 < matlab.unittest.TestCase

    methods (Test)
        function s_add_doubles(testCase)
            testCase.verifyEqual(s_add(1,1), 3);
        end
    end
    
end