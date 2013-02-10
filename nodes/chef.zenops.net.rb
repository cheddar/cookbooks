chef_environment "production"

set[:primary_ipaddress] = "176.9.49.11"

run_list(%w(
  role[chef]
))
