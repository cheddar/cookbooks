include_recipe "kanbanero::user"
include_recipe "mysql"

package "dev-libs/libxslt"

monit_instance "kanbanero" do
  manage false
end

nginx_server "kanbanero" do
  template "nginx.conf"
end

ssl_certificate "/etc/ssl/nginx/www.kanbanero.com" do
  cn "www.kanbanero.com"
end

nrpe_command "check_kanbanero_thin" do
  command "/usr/lib/nagios/plugins/check_pidfile /var/app/kanbanero/shared/pids/thin.pid"
end

nagios_service "KANBAN-THIN" do
  check_command "check_nrpe!check_kanbanero_thin"
  servicegroups "kanbanero"
end
