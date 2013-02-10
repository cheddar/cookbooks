chef_environment "production"

set[:primary_ipaddress] = "176.9.49.10"

run_list(%w(
  role[nagios]
  role[logger]
))
