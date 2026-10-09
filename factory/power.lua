mfsus = {}
mfsus[1] = peripheral.wrap("ic2:mfsu_4")
mfsus[2] = peripheral.wrap("ic2:mfsu_5")
mfsus[3] = peripheral.wrap("ic2:mfsu_6")
mfsus[4] = peripheral.wrap("ic2:mfsu_7")

print("MFSU Charge Status")
print("------------------")
totalCap = 0
totalChg = 0
for i = 1, 4 do
    charge = mfsus[i].getEUStored()
    capacity = mfsus[i].getEUCapacity()
    totalChg = totalChg + charge
    totalCap = totalCap + capacity
    pct = math.floor(charge / capacity * 10000) / 100
    print("MFSU", i, ":", pct, "% full")
end

print()
totalPct = math.floor(totalChg / totalCap * 10000) / 100
totalCap = math.floor(totalCap / 10000) / 100
totalChg = math.floor(totalChg / 10000) / 100
print("Total Charge:", totalChg, "Million EU")
print("Total Capacity:", totalCap, "Million EU")
print("Total Percentage:", totalPct, "Percent")

lp = peripheral.wrap("LogisticsPipes:Request_1")
items = lp.getAvailableItems()
cellSize = 20000
wc = items[30]
ewc = items[234]
--print(wc.getValue1().getName())
--print(ewc.getValue1().getName())
empty = wc.getValue2()
emptyEU = empty * cellSize / 1000000
full = ewc.getValue2()
fullEU = full * cellSize / 1000000
total = empty + full
totalEU = total * cellSize / 1000000
pct = math.floor(full / total * 10000) / 100

--print()
--print("Strategic Power Reserve")
--print("-----------------------")
--print("Empty Cells:", emptyEU, "Million EU")
--print("Full Cells:", fullEU, "Million EU")
--print("Total Cells:", totalEU, "Million EU")
--print("Charge:", pct, "Percent")
