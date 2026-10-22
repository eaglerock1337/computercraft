-- Repository server daemon

function start(config)
  local version = "0.1.0"
  local modem = config.modem or "back"
  local hostname = config.hostname or os.getComputerLabel() or os.getComputerID()
  local protocol = config.protocol or "eaglenet.repo"

  print("Starting repository server on hostname: " .. hostname)
  print("Repo server version: " .. version)
  print("Modem position: " .. modem)

  rednet.open(modem)
  rednet.host(protocol, hostname)

  print("Repo server online advertising " .. rednet.host .. " endpoint.")

  while true do
    local sender, request = rednet.receive(protocol)
    -- Handle incoming requests here
  end
end
