-- Library for Internet and Rednet networking

local network = {}

local function repoUrl(remote, filePath)
  return string.format("%s/%s/%s/%s%s", remote.baseUrl, remote.account, remote.repo, remote.branch, filePath)
end

function network.getRepoFile(remoteCfg, filePath)
  local url = repoUrl(remoteCfg, filePath)
  local response, err = http.get(url)

  if not response then
    return nil, "Failed to download file: " .. err
  end

  local contents = response.readAll()
  response.close()

  return contents
end

return network