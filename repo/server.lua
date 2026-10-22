-- Repository server orchestration script

local sync = require("sync")
local repo = require("repo")
local networkLib = require("lib.network")
local configLib = require("lib.config")

print("Starting repository server orchestration script...")

local config = configLib.load("config.json")

if not config then
  error("Could not load configuration file.")
else
  print("Configuration loaded successfully.")
end

local function startRepoServer()
  repo.start(config)
end

local function startSyncLoop()
  sync.start(config)
end

parallel.waitForAny(
  startRepoServer,
  startSyncLoop
)
