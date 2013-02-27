chef_environment "production"

set[:primary_ipaddress] = "188.40.132.77"
set[:primary_ip6address] = "2a01:4f8:101:3021::1"

run_list(%w(
  role[host]
))
