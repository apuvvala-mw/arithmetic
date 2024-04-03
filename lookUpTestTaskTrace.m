repo = matlab.buildtool.internal.fingerprints.PersistentTaskTraceRepository(matlab.buildtool.internal.cacheRoot(pwd));
t = repo.lookupTrace("test");
t.Inputs
t.Outputs
t.Arguments