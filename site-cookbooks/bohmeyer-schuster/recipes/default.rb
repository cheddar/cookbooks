include_recipe "nginx::php"

ssl_certificate "/etc/ssl/nginx/www.schilder-versand.com" do
  cn "www.schilder-versand.com"
end

# XXX: temporarily disabled until config stabilizes on the server
#nginx_server "chariteam" do
#  template "nginx.conf"
#end

git "/shopsystem2/shops/mysqladmin" do
  repository "https://github.com/phpmyadmin/phpmyadmin"
  revision "RELEASE_3_4_7_1"
end

secret_key = get_password("pma/secret_key", 50)

template "/shopsystem2/shops/mysqladmin/config.inc.php" do
  source "phpmyadmin.config.php"
  owner "root"
  group "root"
  mode "0644"
  variables :secret_key => secret_key
end

shorewall_rule "default" do
  destport "ftp,http,https"
end

shorewall6_rule "default" do
  destport "ftp,http,https"
end

duply_backup "shopsystem" do
  source "/shopsystem2"
end

duply_backup "varwww" do
  source "/var/www"
end
