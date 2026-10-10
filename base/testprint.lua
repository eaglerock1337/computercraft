-- EagleRock Space Agency Printer Test Script
local version = "1.2"

print("ERSA Printer Test v." .. version)
print("=-=-=-=-=-=-=-=-=-=-=\n")
local p = peripheral.find("printer")
assert(p, "No printer found!")
local name = peripheral.getName(p)
print("Found printer: " .. name)
print("  Connecting...\n")

assert(p.newPage(), "Failed to create new page!")
print("Connected to " .. name .. ".")
print("  Writing test page...\n")
assert(p.setPageTitle("ERSA Printer Test Page"), "Failed to set page title!")
local currentLine = 1
local pageWidth, pageHeight = p.getPageSize()

local function printLine(text)
    p.setCursorPos(1, currentLine)
    p.write(text)
    currentLine = currentLine + 1
end

printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("")
printLine(" EagleRock Space Agency")
printLine("   Printer Test Page")
printLine("")
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("Test Day: " .. os.date("%A"))
printLine("Test Date: " .. os.date("%Y-%m-%d"))
printLine("Test Time: " .. os.date("%H:%M:%S"))
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("Test Version: " .. version)
printLine("Computer ID: " .. os.getComputerID())
printLine("Label: " .. (os.getComputerLabel() or "Unassigned"))
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("Printer ID: " .. name)
printLine("Page Size: " .. (pageWidth or "??") .. "x" .. (pageHeight or "??"))
printLine("Paper Level: " .. (p.getPaperLevel() or "??"))
printLine("Ink Level: " .. (p.getInkLevel() or "??"))
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")
printLine("End of Test Page")
printLine("=-=-=-=-=-=-=-=-=-=-=-=-=")

assert(p.endPage(), "Failed to end page!")
print("Test page sent to printer.\n")
print("Printer test completed.")
