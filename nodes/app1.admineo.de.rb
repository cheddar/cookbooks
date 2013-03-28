chef_environment "production"

set[:primary_ipaddress] = "5.9.19.164"

run_list(%w(
  role[base]
  role[admineo]
  recipe[admineo]
  recipe[mongodb::server]
  recipe[mongodb::backup]
))
