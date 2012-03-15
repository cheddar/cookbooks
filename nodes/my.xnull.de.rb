set[:primary_ipaddress] = "188.40.228.153"

run_list(%w(
  role[base]
  recipe[imagemagick]
  recipe[mysql::server]
  recipe[nginx::php]
))
