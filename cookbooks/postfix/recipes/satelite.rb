unless node[:skip][:postfix_satelite]
  include_recipe "postfix"
  include_recipe "postfix::adminforward"
  include_recipe "postfix::tls"

  postconf "relay all mail via relayhost" do
    set :relayhost => node[:postfix][:relayhost],
        :inet_interfaces => "loopback-only"
  end

  if tagged?("nagios-client")
    nrpe_command "check_postfix_satelite" do
      command "/usr/lib/nagios/plugins/check_smtp -H #{node[:postfix][:relayhost]} -t 60 -C 'MAIL FROM: <root@#{node[:fqdn]}>' -R '250 2.1.0 Ok' -C 'RCPT TO: <unhollow@gmail.com>' -R '250 2.1.5 Ok'"
    end

    nagios_service "POSTFIX-SATELITE" do
      check_command "check_nrpe!check_postfix_satelite"
      servicegroups "postfix"
    end
  end
end
