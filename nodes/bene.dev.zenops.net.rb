chef_environment "development"

set[:primary_ipaddress] = "144.76.167.231"
set[:primary_ip6address] = "2a01:4f8:200:43e6::2"

run_list(%w(
  role[base]
  role[workstation]
  recipe[zentoo::dev]
))
