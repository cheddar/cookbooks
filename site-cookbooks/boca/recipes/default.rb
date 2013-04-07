include_recipe "nginx::php"

ssl_certificate "/etc/ssl/nginx/wildcard.boca-app.com" do
  cn "wildcard.boca-app.com"
end

nginx_server "00-redirect" do
  template "redirect.conf"
end

%w(
  api
  apitest
  admin
  admintest
  db
  images
  web
  webtest
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

shorewall_rule "boca" do
  destport "ftp,http,https"
end

shorewall6_rule "boca" do
  destport "ftp,http,https"
end
