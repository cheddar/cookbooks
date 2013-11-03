chef_environment "production"

set[:primary_ipaddress] = "144.76.27.66"

set[:skip][:shorewall] = true

run_list(%w(
  role[base]
  role[bohmeyer-schuster]
  recipe[mysql::server]
  recipe[mysql::backup]
  recipe[bohmeyer-schuster]
  recipe[pure-ftpd]
))
