chef_environment "production"

set[:primary_ipaddress] = "5.9.19.164"

run_list(%w(
  role[base]
  recipe[admineo]
  recipe[mongodb::server]
))
