include ChefUtils::Account

action :create do
  user = get_user(new_resource.user)
  path = "#{user[:dir]}/.config/systemd/user/#{new_resource.name}"

  if new_resource.template
    template path do
      source new_resource.name
      cookbook new_resource.cookbook if new_resource.cookbook
      owner "root"
      group "root"
      mode "0644"
      notifies :run, "execute[systemd-reload-#{user[:name]}]", :immediately
    end
  else
    cookbook_file path do
      source new_resource.name
      cookbook new_resource.cookbook if new_resource.cookbook
      owner "root"
      group "root"
      mode "0644"
      notifies :run, "execute[systemd-reload-#{user[:name]}]", :immediately
    end
  end
end

action :delete do
  user = get_user(new_resource.user)
  path = "#{user[:dir]}/.config/systemd/user/#{new_resource.name}"

  cookbook_file path do
    action :delete
    notifies :run, "execute[systemd-reload-#{user[:name]}]", :immediately
  end
end

action :start do
  user = get_user(new_resource.user)

  execute "systemd-user-unit-start-#{new_resource.name}" do
    command "su -l -c 'systemctl --user start #{new_resource.name}' #{user[:name]}"
    not_if "su -l -c 'systemctl --user is-active #{new_resource.name}' #{user[:name]}"
  end
end

action :stop do
  user = get_user(new_resource.user)

  execute "systemd-user-unit-stop-#{new_resource.name}" do
    command "su -l -c 'systemctl --user stop #{new_resource.name}' #{user[:name]}"
    only_if "su -l -c 'systemctl --user is-active #{new_resource.name}' #{user[:name]}"
  end
end

action :restart do
  user = get_user(new_resource.user)

  execute "systemd-user-unit-restart-#{new_resource.name}" do
    command "su -l -c 'systemctl --user restart #{new_resource.name}' #{user[:name]}"
  end
end

action :enable do
  user = get_user(new_resource.user)

  execute "systemd-user-unit-enable-#{new_resource.name}" do
    command "su -l -c 'systemctl --user enable #{new_resource.name}' #{user[:name]}"
    not_if "su -l -c 'systemctl --user is-enabled #{new_resource.name}' #{user[:name]}"
  end
end

action :disable do
  user = get_user(new_resource.user)

  execute "systemd-user-unit-disable-#{new_resource.name}" do
    command "su -l -c 'systemctl --user disable #{new_resource.name}' #{user[:name]}"
    only_if "su -l -c 'systemctl --user is-enabled #{new_resource.name}' #{user[:name]}"
  end
end
