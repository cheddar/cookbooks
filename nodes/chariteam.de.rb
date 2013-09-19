chef_environment "production"

set[:primary_ipaddress] = "176.9.107.72"

set[:denyhosts][:whitelist] = [
  '160.45.202.20',
]

set[:php][:use_flags] = %w(xmlreader xmlwriter)

set[:mysql][:server][:innodb_flush_log_at_trx_commit] = "2"
set[:mysql][:server][:innodb_thread_concurrency] = 32

run_list(%w(
  role[chariteam]
  recipe[mysql::server]
  recipe[mysql::backup]
  recipe[pure-ftpd]
  recipe[chariteam]
  recipe[xvfb]
))
