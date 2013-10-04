include_recipe "jenkins"

# zentoo
include_recipe "metro"

sudo_rule "jenkins-ezbuild" do
  user "jenkins"
  runas "ALL"
  command "NOPASSWD: /usr/local/metro/ezbuild *"
end

# packer
package "dev-util/packer"

sudo_rule "jenkins-packer" do
  user "jenkins"
  runas "ALL"
  command "NOPASSWD: /usr/bin/packer build template.json"
end
