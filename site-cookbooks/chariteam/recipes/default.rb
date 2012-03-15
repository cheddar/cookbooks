include_recipe "nginx::php"

nginx_server "chariteam" do
  template "nginx.conf"
end
