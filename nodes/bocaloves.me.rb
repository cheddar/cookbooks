set[:primary_ipaddress] = "176.9.124.34"

set[:mysql][:server][:ft_min_word_len] = 3

{
  "htdocs" => "/var/www/localhost/htdocs",
  "lib" => "/var/www/localhost/lib",
}.each do |name, path|
  set[:backup][:configs][name][:source] = path
end

run_list(%w(
  role[boca]
  recipe[mysql::server]
  recipe[mysql::backup]
  recipe[pure-ftpd]
  recipe[boca]
))
