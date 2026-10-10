-- EagleRock Space Agency Printer Test Script
local version = "2.0.0"

print("\nERSA Printer Test v" .. version)
print("=-=-=-=-=-=-=-=-=-=-=-=-=\n")
local p = peripheral.find("printer")
assert(p, "No printer found!")
local name = peripheral.getName(p)
print("  Found printer: " .. name)
print("  Checking supplies...")

local inkLevel = p.getInkLevel()
local paperLevel = p.getPaperLevel()

print("  Ink Level: " .. inkLevel)
print("  Paper Level: " .. paperLevel)

if inkLevel == 0 or paperLevel == 0 then
  error("Please resupply " .. name .. "!")
end

print("\n  Printer is ready. Creating test page...")
assert(p.newPage(), "Failed to create new page!\nCheck " .. name .. " printer!")

print("  Writing test page...")
p.setPageTitle("ERSA Printer Test v" .. version)
local currentLine = 1
local pageWidth, pageHeight = p.getPageSize()

local function printLine(text)
    p.setCursorPos(1, currentLine)
    p.write(text)
    currentLine = currentLine + 1
end

printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("")
printLine("  EagleRock Space Agency")
printLine("    Printer Test Page")
printLine("")
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("  Test Version: " .. version)
printLine("  Computer ID: " .. os.getComputerID())
printLine("  Hostname: " .. (os.getComputerLabel() or "Unassigned"))
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("  Printer ID: " .. name)
printLine("  Page Size: " .. pageWidth .. "x" .. pageHeight)
printLine("  Paper Level: " .. paperLevel)
printLine("  Ink Level: " .. inkLevel)
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("  Test Day: " .. os.date("%A"))
printLine("  Test Date: " .. os.date("%Y-%m-%d"))
printLine("  Test Time: " .. os.date("%H:%M:%S"))
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("    End of Test Page")
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")

print("  Sending test page...")
assert(p.endPage(), "Failed to send page!\nCheck " .. name .. " printer output slots!")
print("  Test page sent to printer.\n")
print("Printer test completed.")
