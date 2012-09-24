set[:primary_ipaddress] = "188.40.132.123"

run_list(%w(
  role[kanbanero]
  recipe[mysql::server]
  recipe[mysql::backup]
  recipe[kanbanero]
))
