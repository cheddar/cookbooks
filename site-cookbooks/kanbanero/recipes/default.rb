include_recipe "mysql"

package "net-libs/nodejs"

capistrano_skeleton "kanbanero"
systemd_user_session "kanbanero"

monit_instance "kanbanero" do
  manage false
  action :delete if systemd_running?
end

cookbook_file "/var/app/kanbanero/shared/config/database.login.yml" do
  source "database.login.yml"
  owner "kanbanero"
  group "kanbanero"
  mode "0640"
end

ssl_certificate "/etc/ssl/nginx/www.kanbanero.com" do
  cn "www.kanbanero.com"
end

nginx_server "kanbanero" do
  template "nginx.conf"
end

shorewall_rule "kanbanero" do
  destport "http,https"
end

shorewall6_rule "kanbanero" do
  destport "http,https"
end

if tagged?("nagios-client")
  nrpe_command "check_kanbanero_thin" do
    command "/usr/lib/nagios/plugins/check_pidfile /var/app/kanbanero/shared/pids/thin.pid"
  end

  nagios_service "KANBAN-THIN" do
    check_command "check_nrpe!check_kanbanero_thin"
    servicegroups "kanbanero"
  end
end
