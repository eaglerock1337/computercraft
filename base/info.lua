
print("=== ERSA Computer Information ===")
print()

-- Computer identity
print("Computer ID: " .. os.getComputerID())
print("Label: " .. (os.getComputerLabel() or "Unassigned"))
print("OS: " .. os.version())
print("Host: " .. tostring(_HOST))

-- System status
print()
print("--- System ---")
print("Uptime: " .. math.floor(os.clock()) .. " seconds")
print("Minecraft Day: " .. os.day())
print("Minecraft Time: " .. textutils.formatTime(os.time(), true))

-- Filesystem
print()
print("--- Storage ---")
print("Capacity: " .. tostring(fs.getCapacity("/")) .. " bytes")
print("Free Space: " .. tostring(fs.getFreeSpace("/")) .. " bytes")

-- Display
local width, height = term.getSize()
print()
print("--- Display ---")
print("Resolution: " .. width .. "x" .. height)
print("Color: " .. tostring(term.isColor()))

-- Connected peripherals
print()
print("--- Peripherals ---")

local devices = peripheral.getNames()
table.sort(devices)

print("Connected: " .. #devices)

for _, name in ipairs(devices) do
    print(name .. " (" .. tostring(peripheral.getType(name)) .. ")")
end
