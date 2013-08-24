chef_environment "testing"

set[:primary_ipaddress] = "5.9.41.226"

run_list(%w(
  role[zenops]
  recipe[libvirt]
))
