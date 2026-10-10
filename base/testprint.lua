print("ERSA Printer Test Program\n")
local p = peripheral.find("printer")
assert(p, "No printer found!")
local name = peripheral.getName(p)
print("Found printer: " .. name)

local function printLine(text)
    p.setCursorPos(1, currentLine)
    p.write(text)
    currentLine = currentLine + 1
end

p.newPage()
p.setPageTitle("ERSA Printer Test Page")

local currentLine = 1
local pageWidth, pageHeight = p.getPageSize()

printLine(" EagleRock Space Agency")
printLine("   Printer Test Page")
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
print("Test page sent to printer.")
print("Printer test completed.")
