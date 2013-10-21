# use this recipe to define resources for shorewall rules

case node[:fqdn]

when "www.zenops.net"
  shorewall_rule "default" do
    destport "http,https"
  end

when "chef.zenops.net"
  shorewall_rule "nginx" do
    destport "http,https,8443,8000"
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

end
