chef_environment "production"

set[:primary_ipaddress] = "144.76.27.66"

run_list(%w(
  role[schilderversand]
  recipe[mysql::server]
  recipe[mysql::backup]
  recipe[schilderversand]
))
