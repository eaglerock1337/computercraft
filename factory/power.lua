local mfsus = {}
mfsus[1] = peripheral.wrap("ic2:mfsu_4")
mfsus[2] = peripheral.wrap("ic2:mfsu_5")
mfsus[3] = peripheral.wrap("ic2:mfsu_6")
mfsus[4] = peripheral.wrap("ic2:mfsu_7")

print("MFSU Charge Status")
print("------------------")
local totalCap = 0
local totalChg = 0
for i = 1, #mfsus do
    local charge = mfsus[i].getEUStored()
    local capacity = mfsus[i].getEUCapacity()
    totalChg = totalChg + charge
    totalCap = totalCap + capacity
    local pct = math.floor(charge / capacity * 10000) / 100
    print("MFSU", i, ":", pct, "% full")
end

print()
local totalPct = math.floor(totalChg / totalCap * 10000) / 100
totalCap = math.floor(totalCap / 10000) / 100
totalChg = math.floor(totalChg / 10000) / 100
print("Total Charge:", totalChg, "Million EU")
print("Total Capacity:", totalCap, "Million EU")
print("Total Percentage:", totalPct .. "%")

local lp = peripheral.wrap("LogisticsPipes:Request_1")
local items = lp.getAvailableItems()
local cellSize = 20000
local wc = items[30]
local ewc = items[234]
--print(wc.getValue1().getName())
--print(ewc.getValue1().getName())
local empty = wc.getValue2()
local emptyEU = empty * cellSize / 1000000
local full = ewc.getValue2()
local fullEU = full * cellSize / 1000000
local total = empty + full
local totalEU = total * cellSize / 1000000
local pct = math.floor(full / total * 10000) / 100

--print()
--print("Strategic Power Reserve")
--print("-----------------------")
--print("Empty Cells:", emptyEU, "Million EU")
--print("Full Cells:", fullEU, "Million EU")
--print("Total Cells:", totalEU, "Million EU")
--print("Charge:", pct, "Percent")
