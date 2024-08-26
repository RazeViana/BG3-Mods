-- File Path Pattern to search for for your Config within other mods
local configFilePathPattern = string.gsub("Mods/%s/ScriptExtender/" .. SET.modTableKey .. "Config.json", "'", "\'")

--- Function to convert JSON data into a payload expected by
--- your API. You may need multiple of these, depending on
--- how complex your expected configurations should be.
--- @param data any Parsed JSON data
--- @param modGUID string UUID of mod providing data
---@return table payload Data converted into the format needed by your API
local function ConvertToPayload(data, modGUID)
  CLUtils.Info("Entering ConvertToPayload", Globals.InfoOverride)

  local payload = {}

  -- Logic to Unpack data into a Payload to send to the API
  return payload
end

--- Send parsed JSON data to an API function
--- @param data any Parsed JSON data
--- @param modGUID string UUID of mod providing data
local function SubmitData(data, modGUID)
  CLUtils.Info("Entering SubmitData", Globals.InfoOverride)
  -- You might need several bits of logic here to better handle specific sections of
  -- data for separate API functions
  --Api.PAYLOADFUNCTION(ConvertToPayload(data, modGUID))
end

--- Attempt to Parse and Load found configuration file.
---@param configStr string String representing the path of a configuration that has been found
---@param modGUID GUIDSTRING UUID of mod providing the configuration
local function TryLoadConfig(configStr, modGUID)
  CLUtils.Info("Entering TryLoadConfig", Globals.InfoOverride)
  local success, data = pcall(function ()
    return Ext.Json.Parse(configStr)
  end)
  if success then
    if data ~= nil then
      SubmitData(data, modGUID)
    end
  else
    CLUtils.Error(
      Strings.ERR_JSON_PARSE_FAIL ..
      Strings.FRAG_PROVIDING_MOD ..
      CLUtils.RetrieveModHandleAndAuthor(modGUID)
    )
  end
end

--- Search for Configuration files.
function LoadConfigFiles()
  CLUtils.Info("Entering LoadConfigFiles", Globals.InfoOverride)
  for _, uuid in pairs(Ext.Mod.GetLoadOrder()) do
    local modData = Ext.Mod.GetMod(uuid)
    local filePath = configFilePathPattern:format(modData.Info.Directory)
    local config = Ext.IO.LoadFile(filePath, "data")
    if config ~= nil and config ~= "" then
      CLUtils.Info(Strings.INFO_FOUND_CONFIG .. CLUtils.RetrieveModHandleAndAuthor(uuid), Globals.InfoOverride)
      local b, err = xpcall(TryLoadConfig, debug.traceback, config, uuid)
      if not b then
        CLUtils.Error(err)
      end
    end
  end
end
