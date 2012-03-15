set[:primary_ipaddress] = "79.140.39.11"

run_list(%w(
  role[base]
  recipe[mysql::server]
))
