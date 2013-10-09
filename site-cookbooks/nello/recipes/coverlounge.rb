## MySQL
include_recipe "mysql::server"
include_recipe "mysql::backup"

## nginx + php
node.set[:php][:slot] = "5.4"

include_recipe "nginx::php"

#ssl_certificate "/etc/ssl/nginx/wildcard.cover-lounge.de" do
#  cn "wildcard.cover-lounge.de"
#end

nginx_server "00-redirect" do
  template "redirect.conf"
end

%w(
  admin
  admindev
  db
  images
  web
  webdev
).each do |vhost|
  cookbook_file "/etc/nginx/servers/#{vhost}.passwd" do
    source "#{vhost}.passwd"
    owner "root"
    group "root"
    mode "0644"
  end

  nginx_server vhost do
    template "#{vhost}.conf"
  end
end

# PHPMyAdmin
directory "/var/www/localhost/htdocs" do
  owner "root"
  group "root"
  mode "0755"
end

git "/var/www/localhost/htdocs/phpmyadmin" do
  repository "https://github.com/phpmyadmin/phpmyadmin"
  revision "RELEASE_3_5_8_2"
end

secret_key = get_password("coverlounge/pma_secret_key", 50)

template "/var/www/localhost/htdocs/phpmyadmin/config.inc.php" do
  source "phpmyadmin.config.php"
  owner "root"
  group "nginx"
  mode "0640"
  variables :secret_key => secret_key
end

## FTP
include_recipe "pure-ftpd"

## Firewall
shorewall_rule "coverlounge" do
  destport "http,https"
end

shorewall6_rule "coverlounge" do
  destport "http,https"
end

## Backup
duply_backup "htdocs" do
  source "/var/www/localhost/htdocs"
end
