set[:primary_ipaddress] = "176.9.96.166"

run_list(%w(
  role[base]
  recipe[mysql::server]
  recipe[pure-ftpd]
  recipe[chariteam]
))
