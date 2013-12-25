description "base role for all nodes"

run_list(%w(
  recipe[base]
  recipe[account]
  recipe[bash]
  recipe[chef::client]
  recipe[cron]
  recipe[duply]
  recipe[ganymed]
  recipe[git]
  recipe[htop]
  recipe[hwraid]
  recipe[lftp]
  recipe[lib_users]
  recipe[mdadm]
  recipe[nss]
  recipe[ntp]
  recipe[openssl]
  recipe[postfix::satelite]
  recipe[python]
  recipe[smart]
  recipe[splunk::forwarder]
  recipe[ssh::server]
  recipe[sudo]
  recipe[syslog]
  recipe[tmux]
  recipe[vim]
  recipe[watchdog]
  recipe[shorewall]
  recipe[local::shorewall-rules]
))

default_attributes({
  chef_domain: 'zenops.net',
})
