-- This is where we manage our main sets of Globals, as well as Imports from
-- other mods. Here we Have Globals,  SET (change to your mod's prefix), and
-- several Community Library Modules imported by default.

Globals = {}

-- Not super important to have, but is a nice spot to define some information
-- about your mod if needed.
SET = {}
SET.UUID = "d5f94218-d2b3-4be8-b19a-f4a7480bd5b0"
SET.modTableKey = "SETemplate"
SET.modPrefix = "SET"
SET.modVersion = Ext.Mod.GetMod(SET.UUID).Info.ModVersion

-- Sets a secondary Mods Table entry for your mod's prefix, to help simplify
-- accessing its functionality from the console when needed.
Mods[SET.modPrefix] = Mods[SET.modTableKey]

-- This is generally used in conjunction with Community Library's Printing
-- Utilities, and can be set to true or false to show or hide CLUtils.Info/
-- Warning messages in the Console.
Globals.InfoOverride = false

-- Importing Community Library functions and Dictionaries for ease of use.
-- See the Community Library Reference Scripts for details on how to use these.
local clImports = {}
clImports[1] = "Globals"
clImports[2] = "Strings"
clImports[3] = "DictUtils"
clImports[4] = "Utils"
clImports[5] = "Validators"

CLGlobals, CLStrings, CLDictUtils, CLUtils, CLValidators = Mods.CommunityLibrary.Import(clImports)
