mfsu = peripheral.wrap("ic2:mfsu_4")
lp = peripheral.wrap("LogisticsPipes:Request_1")
items = lp.getAvailableItems()
lpj = peripheral.wrap("LogisticsPowerJunction_0")

print("MFSU 1 Charge:", mfsu.getEUStored())
print("MFSU 1 Capacity:", mfsu.getEUCapacity()) 
print()
print("LP Junction Charge:", lpj.getEnergyStored())
print("LP Junction Capacity:", lpj.getEnergyCapacity())
print()

for i = 1, 10, 1 do
    print(items[i].getValue1().getName(), ":", items[i].getValue2())
end

sleep(1)
