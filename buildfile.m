function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

origPath = addpath("src");
c = onCleanup(@()path(origPath));

plan("clean") = CleanTask;
plan("test") = TestTask(SourceFiles="src");
plan.DefaultTasks = "test";
end
