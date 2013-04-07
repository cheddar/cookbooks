# dev packages
package "app-portage/gentoolkit-dev"

# zentoo repository
git "/var/cache/portage/zentoo" do
  repository "https://github.com/zentoo/zentoo"
  enable_submodules true
  action :sync
end

git "/var/cache/portage/zentoo-next" do
  repository "https://github.com/zentoo/zentoo"
  revision "next"
  enable_submodules true
  action :sync
end

cookbook_file "/usr/local/sbin/update-zentoo-metadata" do
  source "update-zentoo-metadata.sh"
  owner "root"
  group "root"
  mode "0755"
end

cron "update-zentoo-metadata" do
  command "/usr/local/sbin/update-zentoo-metadata"
  minute "5,35"
end

rsync_module "zentoo-portage" do
  path "/var/cache/portage/zentoo"
  uid "nobody"
  gid "nobody"
  exclude "/.git* /eix.* /scripts"
end

rsync_module "zentoo-portage-next" do
  path "/var/cache/portage/zentoo-next"
  uid "nobody"
  gid "nobody"
  exclude "/.git* /eix.* /scripts"
end

# distfiles
directory "/var/cache/portage/distfiles" do
  owner "root"
  group "root"
  mode "0755"
end

cookbook_file "/usr/local/sbin/update-distfiles-mirror" do
  source "update-distfiles-mirror.sh"
  owner "root"
  group "root"
  mode "0755"
end

cron "update-distfiles-mirror" do
  command "/usr/local/sbin/update-distfiles-mirror"
  minute "23"
  hour "*/3"
end

rsync_module "zentoo-distfiles" do
  path "/var/cache/portage/distfiles"
  uid "nobody"
  gid "nobody"
end

rsync_module "zentoo" do
  path "/var/cache/metro/zentoo"
  uid "nobody"
  gid "nobody"
end

# website
include_recipe "nginx"

directory "/var/www/zentoo.org/htdocs" do
  owner "bene"
  group "users"
  mode "0755"
  recursive true
end

# combined nginx config
nginx_server "mirror" do
  template "mirror.nginx.conf"
end

shorewall_rule "zentoo-mirror" do
  destport "http,https,rsync"
end

shorewall6_rule "zentoo-mirror" do
  destport "http,https,rsync"
end
