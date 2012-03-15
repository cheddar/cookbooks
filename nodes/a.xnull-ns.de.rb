set[:primary_ipaddress] = "188.40.80.108"

set[:mysql][:server][:bind_address] = "0.0.0.0"

run_list(%w(
  role[base]
  recipe[mysql::server]
))
