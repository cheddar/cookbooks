capistrano_skeleton "kanbanero" do
  homedir node[:kanbanero][:homedir]
  authorized_keys_for node[:kanbanero][:deployers]
end

portage_preserve_libs "kanbanero" do
  paths [
    "#{node[:kanbanero][:homedir]}/.rvm/rubies",
    "#{node[:kanbanero][:homedir]}/.rvm/gems",
    "#{node[:kanbanero][:homedir]}/shared/bundle",
  ]
end
