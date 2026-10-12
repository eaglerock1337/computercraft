-- Timer module for scheduling and executing callbacks at specified intervals.
--
-- Usage Example:
--   local myBasicTimer = Timer:new(30)
--   local myCallbackTimer = Timer:new(5, myFunction())
--   myBasicTimer:start()
--   myCallbackTimer:start()
--   while true do  
--     local basicTrigger = myBasicTimer:check()
--     if basicTrigger then
--       print("Basic timer triggered!")
--     end
--     local callbackTrigger = myCallbackTimer:check()
--     if callbackTrigger then
--       callbackTrigger()
--     end
--     os.sleep(1)
--   end
--
local version = "0.1.0"
local Timer = {}
Timer.__index = Timer

local function currentTime()
  return os.epoch("utc") / 1000
end

-- Creates a new Timer instance with the specified interval and optional callback.
function Timer:new(interval, callback)
  local self = setmetatable({}, Timer)
  self.interval = interval
  self.nextRun = 0
  self.callback = callback
  self.version = version
  return self
end

-- Sets the interval and callback for the Timer instance and restarts it.
function Timer:set(interval, callback)
  self.interval = interval or self.interval
  self.callback = callback or self.callback
  self:start()
end

-- Starts the Timer instance.
function Timer:start()
  self.nextRun = currentTime() + self.interval
end

-- Stops the Timer instance.
function Timer:stop()
  self.nextRun = 0
end

-- Checks if the Timer instance has reached its next run time.
-- Returns false if the timer is still running. If triggered, it
-- returns the callback function if configured, true otherwise.
function Timer:check()
  if self.nextRun > 0 and self.interval > 0 and currentTime() >= self.nextRun then
    print("♫ Ding, fries are done! ♬")
    self.nextRun = currentTime() + self.interval
    if self.callback then
      return self.callback()
    end
    return true
  end
  return false
end

return Timer
