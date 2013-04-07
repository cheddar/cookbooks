description "base role for all nodes"

run_list(%w(
  recipe[base]
  recipe[duply]
))

default_attributes({
  :contacts => {
    :hostmaster => "unhollow@gmail.com",
    :cron => "unhollow@gmail.com"
  },

  :postfix => {
    :relayhost => "mx.zenops.net",
  },

  :portage => {
    :SYNC => "rsync://rsync.zentoo.org/zentoo-portage-next",
  },
})
