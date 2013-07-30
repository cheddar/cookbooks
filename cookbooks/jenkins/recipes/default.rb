include_recipe "java"

package "dev-util/jenkins-bin"

execute "jenkins-ssh-key" do
  command "ssh-keygen -f /var/lib/jenkins/.ssh/id_rsa -N '' -C jenkins@#{node[:fqdn]}"
  creates "/var/lib/jenkins/.ssh/id_rsa"
  user "jenkins"
  group "jenkins"
end

systemd_tmpfiles "jenkins"
systemd_unit "jenkins.service"

service "jenkins" do
  action [:enable, :start]
end

package "app-text/sloccount"

include_recipe "jenkins::extras"
