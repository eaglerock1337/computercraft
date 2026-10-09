local repoUrl = "https://raw.githubusercontent.com/eaglerock1337/computercraft/main"
local apiUrl = "https://api.github.com/repos/eaglerock1337/computercraft/contents/"

local args = {...}
local role = args[1]

print("Running Eaglenet Bootstrapper")
print("Role: " .. (role or "none"))

