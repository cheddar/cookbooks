description "Developer Workstations"

run_list(%w(
  role[base]
  recipe[rvm]
  recipe[java]
  recipe[xvfb]
  recipe[virtualbox]
  recipe[mysql::server]
  recipe[mongodb::server]
))
