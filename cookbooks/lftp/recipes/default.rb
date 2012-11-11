case node[:platform]
when "gentoo"
  if root?
    package "net-ftp/lftp"
  end

when "mac_os_x"
  package "lftp"

end

directory "#{node[:homedir]}/.lftp" do
  mode "0700"
end

bookmarks = []

node[:lftp][:bookmarks].each do |name, url|
  bookmarks << "#{name} #{url}"
end

file "#{node[:homedir]}/.lftp/bookmarks" do
  content bookmarks.join("\n")
  mode "0600"
end

template node[:lftp][:configfile] do
  source "lftp.conf"
  mode "0644"
end
