print("Strategic Resource Reserve:")

local lp = peripheral.wrap("LogisticsPipes:Request_1")
local items = lp.getAvailableItems()

local inventory = {}
inventory["Charcoal"] = 0
inventory["Water Cell"] = 0
inventory["Electrolyzed Water Cell"] = 0
inventory["Scrap"] = 0
inventory["Bone"] = 0
inventory["Fertilizer"] = 0
inventory["UU-Matter"] = 0

for k, v in pairs(items) do
    local name = v.getValue1().getName()
    if inventory[name] ~= nil then
        inventory[name] = v.getValue2()
    end
end

for k, v in pairs(inventory) do
    print(k, ":", v)
end

local cellCapacity = 20000
local empty = inventory["Water Cell"]
local full = inventory["Electrolyzed Water Cell"]
local totalCells = empty + full

print()
print("Strategic Power Reserve:")
print("Capacity =", cellCapacity * totalCells / 1000000, "Million EU")
print("Available =", cellCapacity * full / 1000000, "Million EU")

local charge = math.floor(full / totalCells * 10000) / 100
print("Charge =", charge .. "%")
