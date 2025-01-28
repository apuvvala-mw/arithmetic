function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);
addpath("src");
repo = matlab.git.GitRepository
modifiedFiles = repo.ModifiedFiles
suite = testsuite()
suite = suite.selectIf(matlabtest.selectors.DependsOn(modifiedFiles))
testFiles = [suite.Filename]

origPath = addpath("src");
c = onCleanup(@()path(origPath));

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask(Results="issues.sarif");
plan("test") = TestTask(testFiles, SourceFiles=["src/s_add.m", "tests/data"], CodeCoverageResults="results/cov.html");
plan.DefaultTasks = ["modFiles" "check" "test"];
end

function modFilesTask(ctx)
repo = matlab.git.GitRepository;
disp(repo.ModifiedFiles)
end
