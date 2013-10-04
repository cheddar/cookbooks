chef_environment "development"

set[:primary_ipaddress] = "144.76.167.231"

set[:metro][:builds] = %w(zentoo zentoo-next)

run_list(%w(
  role[base]
  role[workstation]
  recipe[zenops::ci]
  recipe[zenops::mirror]
))
