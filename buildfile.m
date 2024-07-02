function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

origPath = addpath("src");
c = onCleanup(@()path(origPath));

plan("clean") = CleanTask;
% plan("test") = TestTask(SourceFiles=["src", "tests/data"], CodeCoverageResults="results/cov.html");
% plan("test") = TestTask(SourceFiles="src", CodeCoverageResults="results/cov.mat");
plan("test") = TestTask(SourceFiles=["src/s_add.m", "tests/data"], CodeCoverageResults="results/cov.html");
plan.DefaultTasks = "test";
end
