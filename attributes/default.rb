case platform
  when "smartos"
    default["redis"]["init_style"] = "smf"
    default["redis"]["conf_dir"] = "/opt/local/etc"
    default["redis"]["data_dir"] = "/var/db/redis"
    default["redis"]["bin_dir"] = "/opt/local/bin"
    default["redis"]["packages"] = %w(redis)
  else
    default["redis"]["init_style"] = "init"
    default["redis"]["conf_dir"] = "/etc/redis"
    default["redis"]["data_dir"] = "/var/lib/redis"
    default["redis"]["bin_dir"] = "/usr/local/bin"
    default["redis"]["packages"] = %w(redis-server redis-client)
end

default["redis"]["install_via"] = "source"

default["redis"]["user"] = "redis"
default["redis"]["version"] = "2.6.4"

# Logging
default["redis"]["log_dir"] = "/var/log/redis"
default["redis"]["log_level"] = "notice"
default["redis"]["syslog"]["enabled"] = true
default["redis"]["syslog"]["identity"] = "redis"
default["redis"]["syslog"]["facility"] = "user"

default["redis"]["daemonize"] = true
default["redis"]["pid_file"] = "/var/run/redis.pid"
default["redis"]["listen_interfaces"] = nil
default["redis"]["port"] = "6379"
default["redis"]["socket"] = nil

default["redis"]["database_count"] = "16"
default["redis"]["max_clients"] = nil
default["redis"]["hash_max_zipmap_entries"] = "512"
default["redis"]["hash_max_zipmap_value"] = "64"
default["redis"]["list_max_ziplist_entries"] = "512"
default["redis"]["list_max_ziplist_value"] = "64"
default["redis"]["set_max_intset_entries"] = "512"
default["redis"]["active_rehashing"] = "yes"
default["redis"]["timeout"] = 0

# Persistence
default["redis"]["rdb"] = {
    "enabled" => true,
    "filename" => "dump.rdb",
    "compression" => "no",
    "frequency" => [
        {"seconds" => "900", "changes" => "1"}
    ]
}

default["redis"]["aof"] = {
    "enabled" => false,
    "filename" => "appendonly.aof",
    "fsync" => "everysec",
    "no_fsync_on_rewrite" => "no",
    "rewrite_percent" => "100",
    "rewrite_size" => "64mb"
}

# Replication
default["redis"]["slave"] = false
default["redis"]["replication"] = {}
default["redis"]["replication"]["search"] = "roles:redis"
default["redis"]["replication"]["listen_interface"] = value_for_platform(
    "smartos" => {
        "default" => "net0"
    },
    "default" => {
        "default" => "eth0"
    }
)
default["redis"]["replication"]["serve_stale_data"] = "yes"
