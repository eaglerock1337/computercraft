
print("=== EagleNet Computer Information ===")
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
