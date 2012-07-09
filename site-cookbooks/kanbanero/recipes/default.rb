include_recipe "kanbanero::user"
include_recipe "mysql"

portage_package_use "dev-db/sqlite" do
  use %w(extensions)
end

package "dev-db/sqlite"

monit_instance "kanbanero" do
  manage false
end

nginx_unicorn "kanbanero" do
  homedir node[:kanbanero][:homedir]
  port node[:kanbanero][:port]
end

ssl_certificate "/etc/ssl/nginx/www.kanbanero.com" do
  cn "www.kanbanero.com"
end

nginx_server "kanbanero" do
  template "nginx.conf"
end

nrpe_command "check_kanbanero_unicorn" do
  command "/usr/lib/nagios/plugins/check_pidfile /var/app/kanbanero/shared/pids/unicorn.pid"
end

nagios_service "KANBAN-UNICORN" do
  check_command "check_nrpe!check_kanbanero_unicorn"
  servicegroups "kanbanero"
end
