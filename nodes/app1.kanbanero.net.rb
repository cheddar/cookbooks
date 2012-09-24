set[:primary_ipaddress] = "176.9.69.244"

run_list(%w(
  role[kanbanero]
  recipe[mysql::server]
  recipe[mysql::backup]
  recipe[kanbanero]
))
