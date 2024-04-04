function plan = buildfile
import matlab.buildtool.tasks.CleanTask
import matlab.buildtool.tasks.CodeIssuesTask
import matlab.buildtool.tasks.TestTask
import matlab.buildtool.tasks.PcodeTask
import matlab.buildtool.Task

plan = buildplan(localfunctions);

origPath = addpath("src");
c = onCleanup(@()path(origPath));

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask;

plan("test") = TestTask("tests", SourceFiles="src", CodeCoverageResults="results/cov.xml", TestResults="results/tr.xml");
plan("pcode") = PcodeTask("l*.m", pwd);
% plan("test") = TestTask();
% plan("test") = TestTask("tests\T1.m", SourceFiles="src");

% proj = matlab.project.loadProject(pwd);
% modifiedFiles = proj.listModifiedFiles();
% plan("prequalify") = TestTask(SourceFiles=[modifiedFiles.Path]);

plan("cacheSave").Inputs = "results";

plan.DefaultTasks = ["check" "test", "pcode"];
end

function cacheSaveTask(context)
outputFolder = context.Task.Inputs.absolutePaths();

cacheFolder = 
end

