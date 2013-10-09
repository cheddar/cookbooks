chef_environment "production"

set[:primary_ipaddress] = "78.46.106.234"

run_list(%w(
  role[base]
  role[nello]
  recipe[nello::coverlounge]
))
