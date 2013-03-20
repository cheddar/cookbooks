chef_environment "production"

set[:primary_ipaddress] = "5.9.41.226"

run_list(%w(
  role[lxc]
))
