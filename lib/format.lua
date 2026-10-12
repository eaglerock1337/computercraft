-- A library for miscellaneous formatting functions.
local format = {}

function format.percent(value)
  return math.floor(value * 10000) / 100
end

return format
