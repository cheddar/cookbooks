# use this recipe to define resources for shorewall rules

nodes = Hash[node.run_state[:nodes].select do |n|
  n[:primary_ipaddress]
end.map do |n|
  [n[:fqdn], n[:primary_ipaddress]]
end]

nodes6 = Hash[node.run_state[:nodes].select do |n|
  n[:primary_ip6address]
end.map do |n|
  [n[:fqdn], n[:primary_ip6address]]
end]

case node[:fqdn]

when "dev.zentoo.org"
  shorewall_rule "chef.zenops.net" do
    dest "$FW:#{nodes['chef.zenops.net']}"
    destport "http,https"
  end

  shorewall_rule "dev.zentoo.org" do
    dest "$FW:#{nodes['dev.zentoo.org']}"
    destport "http,https,rsync,3000,8081"
  end

  shorewall6_rule "dev.zentoo.org" do
    dest "$FW:#{nodes6['dev.zentoo.org']}"
    destport "http,https,rsync,3000,8081"
  end

when "bocaloves.me"
  shorewall_rule "bocaloves.me" do
    dest "$FW:#{nodes['bocaloves.me']}"
    destport "ftp,http,https"
  end

end
