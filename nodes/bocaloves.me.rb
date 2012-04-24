set[:primary_ipaddress] = "176.9.124.34"

set[:mysql][:server][:ft_min_word_len] = 3

run_list(%w(
  role[base]
  recipe[mysql::server]
  recipe[pure-ftpd]
  recipe[boca]
))
