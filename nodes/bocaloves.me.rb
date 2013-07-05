chef_environment "production"

set[:primary_ipaddress] = "176.9.124.34"

set[:mysql][:server][:ft_min_word_len] = 3
set[:mysql][:server][:binlog_format] = 'row'

run_list(%w(
  role[boca]
  recipe[mysql::server]
  recipe[mysql::backup]
  recipe[pure-ftpd]
  recipe[boca]
))
