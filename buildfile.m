function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

origPath = addpath("src");
c = onCleanup(@()path(origPath));

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask(Results="issues.sarif");
plan("test") = TestTask(SourceFiles=["src/s_add.m", "tests/data"], CodeCoverageResults="results/cov.html", RunOnlyImpactedTests=true);
plan.DefaultTasks = ["check" "test"];
end
