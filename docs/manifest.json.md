# manifest.json formatting

Test

## Basic format

```json
{
  "version": <epoch_time_milliseconds>,
  "roles": [
    <roles go here>
  ]
  "packages": [
    <packages go here>
  ],
  "files": [
    <files go here>
  ]
}
```

## Package format

```json
{
  "name": "reposerver",
  "files": [
    "repo.lua",
    "server.lua"
  ]
}
```

## File format

```json
{
  "name": "bootstrap.lua",
  "version": "1.2.0",
  "shasum": <sha256sum>,
  "path": "/"
}
```
