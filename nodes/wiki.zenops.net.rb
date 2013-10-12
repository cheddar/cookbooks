chef_environment "production"

set[:primary_ipaddress] = "5.9.41.247"

run_list(%w(
  role[base]
  recipe[postgresql::server]
  recipe[confluence]
  recipe[nginx]
))
