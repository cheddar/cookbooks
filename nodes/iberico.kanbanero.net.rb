chef_environment "production"

set[:primary_ipaddress] = "176.9.48.174"

run_list(%w(
  role[host]
))
