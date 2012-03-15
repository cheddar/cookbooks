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
  shorewall_rule "test.chariteam.de" do
    dest "$FW:#{nodes['test.chariteam.de']}"
    destport "ftp,http,https"
  end

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

when "zeus.xnull.de"
  shorewall_rule "kanbanero" do
    dest "$FW:#{nodes["kanbanero.com"]}"
    destport "http,https"
  end

  shorewall_rule "keks" do
    dest "$FW:188.40.132.124"
    destport "http,https"
  end

  shorewall_rule "kali" do
    dest "$FW:188.40.132.125"
    destport "ftp,smtp,http,https,pop3,pop3s,imap,imaps"
  end

  shorewall_rule "helios" do
    dest "$FW:188.40.228.147"
    destport "ftp,http,imaps,smtp"
  end

  #shorewall_rule "nagios" do
  #  dest "$FW:#{nodes["nagios.xnull.de"]}"
  #  destport "http,https"
  #end

  shorewall_rule "my" do
    dest "$FW:#{nodes["my.xnull.de"]}"
    destport "git,http,https"
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

when "bocaloves.me"
  shorewall_rule "bocaloves.me" do
    dest "$FW:#{nodes['bocaloves.me']}"
    destport "ftp,http,https"
  end

end
