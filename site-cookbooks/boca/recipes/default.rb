include_recipe "nginx::php"

ssl_certificate "/etc/ssl/nginx/boca-app.com" do
  cn "boca-app.com"
end

nginx_server "boca" do
  template "nginx.conf"
end
