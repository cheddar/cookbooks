run_list(%w(
  role[host]
  recipe[zentoo::mirror]
  recipe[mysql::server]
  recipe[mongodb::server]
))
