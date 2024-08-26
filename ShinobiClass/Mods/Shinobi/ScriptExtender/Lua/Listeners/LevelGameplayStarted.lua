-- Your listener will look something like this. Check the reference scripts to see
-- you need to change - the pattern is this: `FunctionName`, `Number of Parameters`,
-- `before` or `after`, and an anonymous function definition. Use underscores (_) when
-- the name of the parameter is unnecessary, or a descriptive name when it is.
Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function (_, _)
  CLUtils.Info("Entering LevelGameplayStarted Listener", Globals.InfoOverride)

  -- Enter logic to perform upon LevelGameplayStarted

end)
