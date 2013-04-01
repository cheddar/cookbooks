chef_environment "testing"

set[:primary_ipaddress] = "5.9.41.226"

set[:gitlab][:host] = "lab.zenops.de"

run_list(%w(
  role[lxc]
  recipe[gitlab]
))
