chef_environment "development"

set[:primary_ipaddress] = "144.76.167.231"

set[:metro][:builds] = %w(zentoo)
set[:mysql][:server][:binlog_format] = 'row'

run_list(%w(
  role[base]
  role[workstation]
  role[jenkins]
  role[zenops-mirror]
))