chef_environment "testing"

set[:primary_ipaddress] = "176.9.28.173"
set[:primary_ip6address] = "2a01:4f8:150:30a3::1"

set[:primary_interface_bridged] = false

set[:metro][:builds] = ["zentoo", "zentoo-next"]
set[:metro][:aws_access_key_id] = "AKIAJGUN7XK4VYGLLFPA"
set[:metro][:aws_secret_access_key] = "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"

run_list(%w(
  role[base]
  recipe[metro]
  recipe[zentoo::mirror]
  recipe[java]
  recipe[mysql::server]
  recipe[mongodb::server]
))
