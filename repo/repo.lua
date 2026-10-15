-- Repository server daemon

local version = "0.1.0"
local cableSide = "back"
local hostname = (os.GetComputerLabel() or os.GetComputerID())

print("Starting repository server on hostname: " .. hostname)

rednet.open(cableSide)
rednet.host("eaglenet.repo", hostname)
