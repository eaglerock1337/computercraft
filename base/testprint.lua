-- EagleRock Space Agency Printer Test Script
local version = "1.0"

print("ERSA Print Test v." .. version)
print("=-=-=-=-=-=-=-=-=-=-=\n")
local p = peripheral.find("printer")
assert(p, "No printer found!")
local name = peripheral.getName(p)
print("Found printer: " .. name)
print("  Connecting...")

p.newPage()
print("Connected to " .. name .. ".")
print("  Writing test page...\n")
p.setPageTitle("ERSA Printer Test Page")
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

p.endPage()
print("Test page sent to printer.\n")
print("Print test completed.")
