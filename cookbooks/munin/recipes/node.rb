include_recipe "munin"

directory "/etc/ssl/munin" do
  owner "root"
  group "root"
  mode "0755"
end

ssl_ca "/etc/ssl/munin/ca" do
  owner "munin"
  group "munin"
  notifies :restart, "service[munin-node]"
end

ssl_certificate "/etc/ssl/munin/node" do
  cn node[:fqdn]
  owner "munin"
  group "munin"
  notifies :restart, "service[munin-node]"
end

template "/etc/munin/munin-node.conf" do
  source "munin-node.conf"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[munin-node]"
end

file "/etc/munin/plugin-conf.d/munin-node" do
  content ""
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[munin-node]"
end

service "munin-node" do
  action [:enable, :start]
end

if tagged?("nagios-client")
  nagios_service "MUNIN-NODE" do
    check_command "check_munin_node"
  end
end
