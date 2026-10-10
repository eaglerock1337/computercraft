local bootstrapVersion = "0.2.4 beta"

local repoUrlPrefix = "https://raw.githubusercontent.com/eaglerock1337/computercraft/main"
local apiUrl = "https://api.github.com/repos/eaglerock1337/computercraft/contents/"


local function getFile(sourcePath, destinationPath)
	print("    Downloading:", destinationPath)

	local response, err = http.get(sourcePath .. "?v=" .. os.epoch("utc"))

	if not response then
		return false, "Failed to download file: " .. err
	end

	local contents = response.readAll()
	response.close()

	local file, fileErr = fs.open(destinationPath, "w")

	if not file then
		return false, "Failed to open file: " .. fileErr
	end

	file.write(contents)
	file.close()

	return true
end

local function getDirectoryListing(directory)
	local fullPath = apiUrl .. directory

	local response, err = http.get(fullPath)

	if not response then
		return false, err
	end

	local contents = response.readAll()
	response.close()

	local files = textutils.unserializeJSON(contents)

	local results = {}

	for num, file in ipairs(files) do
		results[num] = file
	end

	return true, results
end

local function downloadDirectory(sourceDirectory, destinationDirectory)
	local success, files = getDirectoryListing(sourceDirectory)

	if not success then
		return false, files
	end

	for _, file in ipairs(files) do
		local sourcePath = file.download_url
		local destinationPath = destinationDirectory .. "/" .. file.name

		local fileSuccess, fileErr = getFile(sourcePath, destinationPath)

		if not fileSuccess then
			return false, file.name .. ": " .. fileErr
		end
	end

	return true
end

local args = {...}
local role = args[1]:lower()

if role == nil then
	role = "base"
end

print("Eaglenet Bootstrapper v" .. bootstrapVersion)
print("Role: " .. role)

local bootSuccess, bootErr = getFile(repoUrlPrefix .. "/bootstrap.lua", "/bootstrap.lua")
if bootSuccess then
	print("Successfully updated bootstrapper")
else
	error("Error downloading bootstrap.lua: " .. bootErr)
end

local baseSuccess, baseErr = downloadDirectory("base", "")
if baseSuccess then
	print("Successfully downloaded base scripts")
else
	error("Error downloading base scripts: " .. baseErr)
end

local roleSuccess, roleErr = downloadDirectory(role, "")
if roleSuccess then
	print("Successfully downloaded " .. role .. " scripts")
else
	error("Error downloading " .. role .. " scripts: " .. roleErr)
end

print()
print("Bootstrap process completed successfully.")
print("Welcome to Eaglenet!")
