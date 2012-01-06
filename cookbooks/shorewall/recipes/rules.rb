# use this recipe to define resources for shorewall rules

nodes = Hash[node.run_state[:nodes].map do |n|
  [n[:fqdn], n[:ipaddress]]
end]

nodes6 = Hash[node.run_state[:nodes].select do |n|
  n[:ip6address]
end.map do |n|
  [n[:fqdn], n[:ip6address]]
end]

case node[:fqdn]

when "dev.zentoo.org"
  shorewall_rule "dev.zentoo.org" do
    dest "$FW:#{nodes['dev.zentoo.org']}"
    destport "http,https,rsync,3000,8081"
  end

  shorewall6_rule "dev.zentoo.org" do
    dest "$FW:#{nodes6['dev.zentoo.org']}"
    destport "http,https,rsync,3000,8081"
  end

end
