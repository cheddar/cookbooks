run_list(%w(
  role[base]
  recipe[mysql::server]
  recipe[pure-ftpd]
  recipe[boca]
))
