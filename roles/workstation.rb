description "Developer Workstations"

run_list(%w(
  recipe[base]
  recipe[bash]
  recipe[firefox]
  recipe[git]
  recipe[htop]
  recipe[imagemagick]
  recipe[java]
  recipe[lftp]
  recipe[mongodb::server]
  recipe[mysql::server]
  recipe[python]
  recipe[redis]
  recipe[rvm]
  recipe[ssh]
  recipe[tmux]
  recipe[vim]
  recipe[virtualbox]
  recipe[xvfb]
  recipe[zenops::workstation]
  recipe[zookeeper]
))
