include_recipe "nginx::php"

# XXX: temporarily disabled until config stabilizes on the server
#nginx_server "chariteam" do
#  template "nginx.conf"
#end
