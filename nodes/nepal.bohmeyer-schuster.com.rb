chef_environment "production"

set[:primary_ipaddress] = "144.76.99.210"

run_list(%w(
  role[nepal]
))
