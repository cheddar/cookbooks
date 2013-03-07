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
  # LXC
  #shorewall_lxc_bridge "lxc" do
  #  interface "lxc0"
  #  bridged "eth0"
  #end

  shorewall_interface "nodes" do
    interface "vboxnet0 0.0.0.0 optional"
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

  shorewall_rule "nagios" do
    dest "$FW:#{nodes["nagios.zenops.net"]}"
    destport "http,https,8000"
  end

  {
    :subnet => "216.221.226.0/24",
    :lb1 => "107.21.102.64",
    :lb2 => "50.17.228.210",
    :lb3 => "23.23.140.99",
  }.each do |name, addr|
    shorewall_rule "no-splunk-out-#{name}" do
      action "DROP"
      source "all"
      dest "net:#{addr}"
      proto "-"
    end

    shorewall_rule "no-splunk-in-#{name}" do
      action "DROP"
      source "net:#{addr}"
      dest "all"
      proto "-"
    end
  end

  node.run_state[:nodes].each do |n|
    shorewall_rule "syslog@#{n[:fqdn]}" do
      source "$FW:#{n[:primary_ipaddress]}"
      dest "$FW:#{nodes["nagios.zenops.net"]}"
      destport "514"
    end
  end

  node.run_state[:nodes].each do |n|
    next unless node[:tags].include?("splunk-forwarder")
    shorewall_rule "splunk-forwarder@#{n[:fqdn]}" do
      source "$FW:#{n[:primary_ipaddress]}"
      dest "$FW:#{nodes["nagios.zenops.net"]}"
      destport "9997"
    end
  end

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
  shorewall_rule "keks" do
    dest "$FW:188.40.132.124"
    destport "http,https"
  end

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
    destport "ftp,http,https"
  end

when "chariteam.de"
  shorewall_rule "chariteam.de" do
    destport "ftp,http,https"
  end

when "iberico.kanbanero.net"
  # LXC
  shorewall_lxc_bridge "lxc" do
    interface "lxc0"
    bridged "eth0"
  end

  shorewall_rule "app1" do
    dest "$FW:#{nodes['app1.kanbanero.net']}"
    destport "http,https"
  end

  shorewall_rule "staging" do
    dest "$FW:#{nodes['staging.kanbanero.net']}"
    destport "http,https"
  end

end
