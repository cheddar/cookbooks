# portage
package "app-portage/gentoolkit-dev"

# zentoo master
git "/var/cache/mirror/zentoo/portage" do
  repository "https://github.com/zentoo/zentoo"
  enable_submodules true
  action :checkout
end

rsync_module "zentoo-portage" do
  path "/var/cache/mirror/zentoo/portage"
  uid "nobody"
  gid "nobody"
  exclude "/.git* /eix.* /scripts"
end

sudo_rule "jenkins-zentoo-portage-metadata" do
  user "jenkins"
  runas "ALL"
  command "NOPASSWD: /var/cache/mirror/zentoo/portage/scripts/generate-cache"
end

# zentoo next
git "/var/cache/mirror/zentoo-next/portage" do
  repository "https://github.com/zentoo/zentoo"
  revision "next"
  enable_submodules true
  action :checkout
end

sudo_rule "jenkins-zentoo-portage-next-metadata" do
  user "jenkins"
  runas "ALL"
  command "NOPASSWD: /var/cache/mirror/zentoo-next/portage/scripts/generate-cache"
end

rsync_module "zentoo-portage-next" do
  path "/var/cache/mirror/zentoo-next/portage"
  uid "nobody"
  gid "nobody"
  exclude "/.git* /eix.* /scripts"
end

# distfiles
directory "/var/cache/mirror/zentoo/distfiles" do
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

sudo_rule "jenkins-zentoo-distfiles" do
  user "jenkins"
  runas "ALL"
  command "NOPASSWD: /usr/local/sbin/update-distfiles-mirror"
end