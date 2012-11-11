description "base role for all nodes"

run_list(%w(
  recipe[base]
  recipe[duply]
  recipe[postfix::satelite]
  recipe[chef::client]
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
