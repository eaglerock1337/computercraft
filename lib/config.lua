-- Configuration file library

local config = {}

function config.load(filename)
  local file = fs.open(filename, "r")
  if not file then
    error("Could not open config file: " .. filename)
  end

  local content = file.readAll()
  file.close()

  local ok, result = pcall(textutils.unserialize, content)
  if not ok then
    error("Could not parse config file: " .. filename)
  end

  return result
end

return config