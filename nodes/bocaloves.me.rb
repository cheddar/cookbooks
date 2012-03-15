set[:primary_ipaddress] = "176.9.124.34"

run_list(%w(
  role[base]
  recipe[mysql::server]
  recipe[pure-ftpd]
  recipe[boca]
))
