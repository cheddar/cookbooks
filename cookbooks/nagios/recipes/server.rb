tag("nagios-master")

include_recipe "nginx::php"

portage_package_use "net-analyzer/nagios-plugins" do
  use %w(ldap mysql nagios-dns nagios-ntp nagios-ping nagios-ssh postgres)
end

package "net-analyzer/nagios"

include_recipe "nagios"
include_recipe "nagios::livestatus"
include_recipe "nagios::nrpe"
include_recipe "nagios::nsca"

directory "/var/nagios/rw" do
  owner "nagios"
  group "nginx"
  mode "6755"
end

file "/var/nagios/rw/nagios.cmd" do
  owner "nagios"
  group "nginx"
  mode "0660"
  action :create_if_missing # prevent chef from building a checksum on a FIFO
  only_if { File.exist?("/var/nagios/rw/nagios.cmd") } # do not create the FIFO ourselves
end

template "/usr/lib/nagios/plugins/notify" do
  source "notify.#{node[:nagios][:notifier]}"
  owner "root"
  group "nagios"
  mode "0750"
end

# retrieve data from the search index
contacts = node.run_state[:users].select do |u|
  u[:tags] and not (u[:tags] & ["hostmaster", "nagios"]).empty?
end.sort_by do |u|
  u[:id]
end

hostmasters = contacts.select do |c|
  c[:tags] and c[:tags].include?("hostmaster")
end.map do |c|
  c[:id]
end

hosts = node.run_state[:nodes].select do |n|
  n[:tags].include?("nagios-client") rescue false
end.sort_by do |n|
  n[:fqdn]
end

roles = node.run_state[:roles].reject do |r|
  r.name == "base"
end.sort_by do |r|
  r.name
end

# build hostgroups
hostgroups = {}

hosts.each do |h|
  # group per cluster
  cluster = h[:cluster][:name] rescue "default"

  hostgroups[cluster] ||= []
  hostgroups[cluster] << h[:fqdn]

  # group per role (except base)
  h[:roles] ||= []
  h[:roles].each do |r|
    next if r == "base"
    hostgroups[r] ||= []
    hostgroups[r] << h[:fqdn]
  end
end

# build service groups
servicegroups = []
hosts.each do |h|
  h[:nagios][:services].each do |name, params|
    if params[:servicegroups]
      servicegroups |= params[:servicegroups].split(",")
    end
  end
end

# remove sample objects
%w(hosts localhost printer services switch windows).each do |f|
  file "/etc/nagios/objects/#{f}.cfg" do
    action :delete
  end
end

# nagios base config
%w(nagios nsca resource).each do |f|
  nagios_conf f do
    subdir false
  end
end

nagios_conf "cgi" do
  subdir false
  variables :hostmasters => hostmasters
end

# create nagios objects
nagios_conf "commands"

nagios_conf "templates" do
  variables :hostmasters => hostmasters
end

nagios_conf "contacts" do
  variables :contacts => contacts
end

nagios_conf "timeperiods" do
  variables :contacts => contacts
end

nagios_conf "hostgroups" do
  variables :hostgroups => hostgroups
end

nagios_conf "servicegroups" do
  variables :servicegroups => servicegroups
end

hosts.each do |host|
  nagios_conf "host-#{host[:fqdn]}" do
    template "host.cfg.erb"
    variables :host => host
  end
end

include_recipe "nagios::extras"

systemd_unit "nagios.service"

service "nagios" do
  action [:enable, :start]
end

cookbook_file "/etc/init.d/nsca" do
  source "nsca.initd"
  owner "root"
  group "root"
  mode "0755"
end

service "nsca" do
  action [:disable, :stop]
end

# Web UI
group "nagios" do
  members %w(nginx)
  append true
end

file "/etc/nagios/users" do
  content contacts.map { |c| "#{c[:id]}:#{c[:password]}" }.join("\n")
  owner "root"
  group "nginx"
  mode "0640"
end

spawn_fcgi "nagios" do
  user "nagios"
  group "nagios"
  program "/usr/sbin/fcgiwrap"
  socket({
    :user => "nginx",
    :group => "nginx",
  })
end

nginx_server "nagios" do
  template "nginx.conf"
end

shorewall_rule "nagios" do
  destport "80,443"
end

file "/var/www/localhost/htdocs/index.php" do
  action :delete
end

file "/var/www/localhost/htdocs/index.html" do
  action :delete
end

template "/usr/share/nagios/htdocs/index.php" do
  source "index.php"
  owner "nagios"
  group "nagios"
  mode "0644"
end

cookbook_file "/usr/share/nagios/htdocs/side.php" do
  source "side.php"
  owner "nagios"
  group "nagios"
  mode "0644"
end

# nagios health check
nrpe_command "check_nagios" do
  command "/usr/lib/nagios/plugins/check_nagios -F /var/nagios/status.dat -C /usr/sbin/nagios -e 5"
end

nagios_service "NAGIOS" do
  check_command "check_nrpe!check_nagios"
end

# splunk integration
splunk_input "monitor:///var/nagios/nagios.log" do
  sourcetype "nagios"
  index "nagios"
end

splunk_input "monitor:///var/nagios/host-perfdata" do
  sourcetype "nagioshostperf"
  index "nagios"
end

splunk_input "monitor:///var/nagios/service-perfdata" do
  sourcetype "nagiosserviceperf"
  index "nagios"
end
