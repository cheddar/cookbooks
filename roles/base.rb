description "base role for all nodes"

run_list(%w(
  recipe[base]
  recipe[duply]
  recipe[postfix::satelite]
  recipe[chef::client]
  recipe[splunk::forwarder]
  recipe[ganymed]
))

default_attributes({
  :contacts => {
    :hostmaster => "unhollow@gmail.com",
    :cron => "unhollow@gmail.com"
  },

  :postfix => {
    :relayhost => "mx.zenops.net",
  },

})
