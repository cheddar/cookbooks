include_recipe "admineo::user"
include_recipe "mongodb"

package "dev-libs/libxslt"
package "net-libs/nodejs"

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
