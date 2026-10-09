local math = {}

function math.formatPct(value)
  return math.floor(value * 10000) / 100
end

return math
