include_recipe "mongodb"

package "net-libs/nodejs"

capistrano_skeleton "admineo"
systemd_user_session "admineo"

nginx_unicorn "admineo" do
  homedir node[:admineo][:homedir]
  port node[:admineo][:port]
end

ssl_certificate "/etc/ssl/nginx/www.admineo.de" do
  cn "www.admineo.de"
end

nginx_server "admineo" do
  template "nginx.conf"
end

shorewall_rule "admineo" do
  destport "http,https"
end

shorewall6_rule "admineo" do
  destport "http,https"
end
