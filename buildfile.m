function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);
% addpath("src");
% repo = matlab.git.GitRepository
% modifiedFiles = repo.ModifiedFiles
% suite = testsuite()
% suite = suite.selectIf(matlabtest.selectors.DependsOn(modifiedFiles))
% testFiles = [suite.Filename]

origPath = addpath("src");
c = onCleanup(@()path(origPath));

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask(Results="issues.sarif");
plan("test") = TestTask(SourceFiles=["src/s_add.m", "tests/data"], CodeCoverageResults="results/cov.html", RunOnlyImpactedTests=true, ImpactedSince="main");
% plan.DefaultTasks = ["modFiles" "check" "test"];
plan.DefaultTasks = ["check" "test"];
end

function modFilesTask(ctx)
repo = matlab.git.GitRepository;
disp(repo.ModifiedFiles);
end
