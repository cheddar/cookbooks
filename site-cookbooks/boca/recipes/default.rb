include_recipe "nginx::php"

ssl_certificate "/etc/ssl/nginx/wildcard.boca-app.com" do
  cn "wildcard.boca-app.com"
end

nginx_server "boca" do
  template "nginx.conf"
end
