Redis
=====

## Description

Installs and configures Redis.

## Requirements


## Attributes


## Usage


### Network Interfaces

By default, Redis will be configured to listen on all interfaces. In order to limit Redis connections
to specific interfaces, pass a hash to the `node.redis.listen_interfaces` attribute, with network name as
the key and network protocol as the value.

```json
"redis": {
    "listen_interfaces": {
        "net0": "inet",
        "net1": "inet6",
        "lo0" : "inet"
    }
}
```
