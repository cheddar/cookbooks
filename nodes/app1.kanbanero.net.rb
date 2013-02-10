chef_environment "production"

set[:primary_ipaddress] = "176.9.69.244"

set[:mysql][:server][:long_query_time] = "0.1"

run_list(%w(
  role[kanbanero]
  recipe[mysql::server]
  recipe[mysql::backup]
  recipe[kanbanero]
))
