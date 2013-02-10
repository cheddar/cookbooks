chef_environment "production"

set[:primary_ipaddress] = "188.40.132.77"

run_list(%w(
  role[host]
))
