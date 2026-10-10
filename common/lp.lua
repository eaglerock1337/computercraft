local lp = {}

function lp.getCounts(items)
  local result = items
	for k, v in pairs(result) do
    local name = v.getValue1().getName()
    if result[name] ~= nil then
      result[name] = v.getValue2()
    end
	end

	return result
end

return lp
