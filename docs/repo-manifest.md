# Repository manifest JSON

## Individual package metadata

### Regular file

```json
{  
    "name": "bootstrap.lua",
    "version": "0.4.0",
    "shasum": "<valid_sha>",
    "directory": "/",
    "role": "base"
}
```

### Library

```json
{  
    "name": "format.lua",
    "version": "1.2.0",
    "shasum": "<valid_sha>",
    "directory": "/lib",
    "role": "base"
}
```

## Role metadata

```json
{
    "name": "repo",
    "depends_on": ["base", "factory"],
    "packages": ["repo.lua", "server.lua", "sync.lua"]
}
```

## Full repository `manifest.json`

```json
{
    "manifest_id": <epoch_time>,
    "roles": [
        <list of roles here>
    ],
    "packages": [
        <list of packages here>
    ]
}

```