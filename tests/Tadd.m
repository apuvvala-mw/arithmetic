classdef Tadd < matlab.unittest.TestCase

    methods (Test)
        function s_add_doubles(testCase)
            load("data/myfile.mat");
            testCase.verifyEqual(s_add(1,1), 2);
        end
    end
    
end