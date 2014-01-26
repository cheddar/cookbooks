chef_environment "production"

set[:primary_ipaddress] = "5.9.47.134"

run_list(%w(
  role[zenops]
  role[mx]
  role[nagios]
  role[splunk-server]
  role[gitlab]
))
