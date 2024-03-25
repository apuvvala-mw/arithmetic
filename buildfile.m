function plan = buildfile
import matlab.buildtool.tasks.CleanTask
import matlab.buildtool.tasks.CodeIssuesTask
import matlab.buildtool.tasks.TestTask

plan = buildplan(localfunctions);

origPath = addpath("src");
c = onCleanup(@()path(origPath));

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask;
plan("test") = TestTask(SourceFiles="src");
% plan("test") = TestTask();
% plan("test") = TestTask("tests\T1.m", SourceFiles="src");

plan.DefaultTasks = ["check" "test"];
end
