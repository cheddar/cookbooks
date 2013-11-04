include_recipe "nginx::php"

ssl_certificate "/etc/ssl/nginx/chariteam" do
  cn node[:fqdn]
end

# XXX: temporarily disabled until config stabilizes on the server
#nginx_server "chariteam" do
#  template "nginx.conf"
#end

shorewall_rule "chariteam" do
  destport "ftp,http,https"
end

shorewall6_rule "chariteam" do
  destport "ftp,http,https"
end

duply_backup "varwww" do
  source "/var/www"
end

duply_backup "home" do
  source "/home"
end
