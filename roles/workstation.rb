description "Developer Workstations"

run_list(%w(
  role[base]
  recipe[rvm]
  recipe[java]
  recipe[xvfb]
  recipe[firefox]
  recipe[virtualbox]
  recipe[imagemagick]
  recipe[zenops::workstation]
  recipe[mysql::server]
  recipe[mongodb::server]
))
