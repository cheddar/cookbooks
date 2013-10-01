chef_environment "production"

set[:primary_ipaddress] = "144.76.167.231"

run_list(%w(
  role[base]
))

