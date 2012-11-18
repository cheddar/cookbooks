set[:primary_ipaddress] = "80.244.253.229"

run_list(%w(
  role[base]
  recipe[mysql::server]
))
