set[:primary_ipaddress] = "176.9.28.173"
set[:primary_ip6address] = "2a01:4f8:150:30a3::1"

run_list(%w(
  role[host]
  recipe[java]
  recipe[zentoo::mirror]
  recipe[mysql::server]
  recipe[mongodb::server]
))
