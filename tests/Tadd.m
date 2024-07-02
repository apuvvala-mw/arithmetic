classdef Tadd < matlab.unittest.TestCase

    methods (Test)
        function s_add_doubles(testCase)
            % loadData;
            filename = "data/myfile.mat";
            load(filename, "value");
            sayHi();
            testCase.verifyEqual(s_add(value,1), 4);
        end
    end

end

function sayHi()
disp("hello")
end

% function loadData()
% load("data/myfile.mat", "value");
% end