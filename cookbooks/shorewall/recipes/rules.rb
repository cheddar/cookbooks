# use this recipe to define resources for shorewall rules

nodes = Hash[node.run_state[:nodes].map do |n|
  [n[:fqdn], n[:ipaddress]]
end]

case node[:fqdn]

when "dev.zentoo.org"
  shorewall_rule "zentoo" do
    destport "http,https,rsync,3000"
  end

end
