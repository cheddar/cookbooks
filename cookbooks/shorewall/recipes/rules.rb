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

when "zeus.xnull.de"
  shorewall_rule "helios" do
    dest "$FW:#{nodes['linux-vserver.org']}"
    destport "ftp,http,imaps,smtp"
  end

  shorewall_rule "kali" do
    dest "$FW:#{nodes['kali.xnull.de']}"
    destport "ftp,smtp,http,https,pop3,pop3s,imap,imaps"
  end

  # these nodes are not deployed or managed
  shorewall_rule "noth" do
    dest "$FW:188.40.228.146"
    proto "-"
  end

  shorewall_rule "nemesis" do
    dest "$FW:188.40.228.151"
    proto "-"
  end

when "chaos.home.xnull.de"
  shorewall_rule "chaos" do
    destport "-"
  end

end
