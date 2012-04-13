set[:primary_ipaddress] = "176.9.96.166"

set[:denyhosts][:whitelist] = [
  '160.45.202.20',
]

run_list(%w(
  role[base]
  recipe[mysql::server]
  recipe[pure-ftpd]
  recipe[chariteam]
  recipe[xvfb]
))
