chef_environment "production"

set[:primary_ipaddress] = "5.9.47.134"

run_list(%w(
  role[chef]
))
