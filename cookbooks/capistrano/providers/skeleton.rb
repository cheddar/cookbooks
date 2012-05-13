include ChefUtils::Account

action :create do
  user = new_resource.name
  uid = new_resource.uid
  groups = new_resource.groups
  homedir = if new_resource.homedir == nil
              "/var/app/#{user}"
            else
              new_resource.homedir
            end

  akf = new_resource.authorized_keys_for
  akf = [akf] unless akf.is_a?(Array)

  authorized_keys = authorized_keys_for(akf)

  group user do
    gid uid if uid
  end

  account user do
    comment "capistrano skeleton for #{user}"
    shell "/bin/bash"
    home homedir
    home_mode "0755"
    uid uid if uid
    gid user
    groups groups
    authorized_keys authorized_keys
  end

  cookbook_file "#{homedir}/.ssh/id_rsa" do
    source "id_rsa"
    owner user
    group user
    mode "0600"
  end

  cookbook_file "#{homedir}/.ssh/id_rsa.pub" do
    source "id_rsa.pub"
    owner user
    group user
    mode "0644"
  end

  %w(
    bin
    releases
    shared
  ).each do |d|
    directory "#{homedir}/#{d}" do
      owner user
      group user
      mode "0755"
    end
  end

  shared = %w(config log pids system) + new_resource.shared

  shared.uniq.each do |d|
    directory "#{homedir}/shared/#{d}" do
      owner user
      group user
      mode "0755"
    end
  end

  file "/etc/logrotate.d/capistrano-#{user}" do
    content <<-EOS
#{homedir}/shared/log/*.log {
 missingok
 rotate 21
 copytruncate
}
EOS
    owner "root"
    group "root"
    mode "0644"
  end

  if new_resource.rvm
    version = new_resource.rvm

    rvm_instance user do
      version version
    end
  end

end
