include_recipe "nginx::php"

nginx_server "boca" do
  template "nginx.conf"
end
