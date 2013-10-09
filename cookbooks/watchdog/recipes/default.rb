case node[:platform]
when "gentoo"
  package "sys-apps/watchdog"

  cookbook_file "/etc/watchdog.conf" do
    source "watchdog.conf"
    owner "root"
    group "root"
    mode "0644"
  end

  systemd_unit "watchdog.service"

  service "watchdog" do
    action [:enable, :start]
  end

when "debian"
  # Currently blocked by amc!?
  #package "watchdog"
end
