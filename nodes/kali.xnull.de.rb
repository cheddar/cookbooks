chef_environment "production"

set[:primary_ipaddress] = "188.40.132.125"

set[:nepal][:debug] = true

set[:php][:upload][:max_filesize] = "16M"
set[:postfix][:message_size_limit] = 25

run_list(%w(
  role[base]
  role[nepal]
))
