-- This is where you manage String Values. It's cleaner to throw them in here
-- as variables rather than hand-write them across all your functions, especially
-- if there's more than one instnace of the same string, or if one string gets
-- really long.
Strings = {}

-- FRAG is short for Fragment. This can be anything from a few words bridging
-- other strings, to things like a colon.
Strings.FRAG_SAMPLE = "This is an incomplete sentence that will bridge other strings"
Strings.FRAG_PROVIDING_MOD = " Providing mod: "

-- INFO will be the blue text you see in the console. It's just informative,
-- more often used for debugging cues.
Strings.INFO_SAMPLE = "This is a sample info text"
Strings.INFO_FOUND_CONFIG = "Found config for Mod: "

-- WARN is short for Warning. This will be Yellow text. It's used for potential
-- issues that don't break things, or for important text that shouldn't be
-- ignored, or for warnings that something is deprecated and that refactoring
-- is needed.
Strings.WARN_SAMPLE = "This is a sample warning"

-- ERR is short for Error. This will be Red text. It's used when something has
-- gone wrong.
Strings.ERR_SAMPLE = "This is a sample error"
Strings.ERR_JSON_PARSE_FAIL = "Failed to parse Sample Template Configuration file. "
