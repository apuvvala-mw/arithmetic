function plan = buildfile
import matlab.buildtool.tasks.CleanTask
import matlab.buildtool.tasks.CodeIssuesTask
import matlab.buildtool.tasks.TestTask
import matlab.buildtool.Task

plan = buildplan(localfunctions);

origPath = addpath("src");
c = onCleanup(@()path(origPath));

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask;

plan("test") = TestTask(SourceFiles="src", CodeCoverageResults="results/cov.xml");
% plan("test") = TestTask();
% plan("test") = TestTask("tests\T1.m", SourceFiles="src");

% proj = matlab.project.loadProject(pwd);
% modifiedFiles = proj.listModifiedFiles();
% plan("prequalify") = TestTask(SourceFiles=[modifiedFiles.Path]);

plan.DefaultTasks = ["check" "test"];
end

