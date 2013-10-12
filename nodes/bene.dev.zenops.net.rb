chef_environment "development"

set[:primary_ipaddress] = "144.76.167.231"

set[:metro][:builds] = %w(zentoo zentoo-next)
set[:mysql][:server][:binlog_format] = 'row'

run_list(%w(
  role[base]
  role[workstation]
  recipe[mysql::server]
  recipe[mongodb::server]
  recipe[zookeeper]
  recipe[zenops::ci]
  recipe[zenops::mirror]
))
