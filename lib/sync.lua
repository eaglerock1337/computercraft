-- Repository Synchronizer Job

local network = require("lib.network")
local timer = require("lib.timer")

local appDir = "/srv"
local repoDir = "/repo"

local githubRepo = "https://raw.githubusercontent.com/eaglerock1337/computercraft/refs/heads/main/"
local repoManifest = "manifest.json"

