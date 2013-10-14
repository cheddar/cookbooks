chef_environment "development"

set[:primary_ipaddress] = "144.76.167.231"

set[:metro][:builds] = %w(zentoo)
set[:mysql][:server][:binlog_format] = 'row'

run_list(%w(
  role[base]
  role[workstation]
  role[zenops-mirror]
  recipe[mysql::server]
  recipe[mongodb::server]
  recipe[zookeeper]
))
