chef_environment "testing"

set[:primary_ipaddress] = "176.9.28.173"
set[:primary_ip6address] = "2a01:4f8:150:30a3::1"

set[:primary_interface_bridged] = false

set[:metro][:builds] = ["zentoo", "zentoo-next"]
set[:metro][:aws_access_key_id] = "AKIAJ3QVLL4QG5UJFIMQ"
set[:metro][:aws_secret_access_key] = "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"

run_list(%w(
  role[base]
  recipe[java]
  recipe[metro]
  recipe[zentoo::dev]
  recipe[zentoo::mirror]
  recipe[mysql::server]
  recipe[mongodb::server]
  recipe[postgresql::server]
))
