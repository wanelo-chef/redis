
include_recipe "smartos"

node["redis"]["packages"].each do |package_name|
  package package_name
end

include_recipe "redis::configure"
