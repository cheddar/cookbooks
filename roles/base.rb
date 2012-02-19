description "base role for all nodes"

run_list(%w(
  recipe[base]
  recipe[duply]
  recipe[postfix::satelite]
  recipe[chef::client]
  recipe[nagios::client]
  recipe[munin::node]
))

default_attributes({
  "portage" => {
    "BINHOST" => "http://chef.zenops.net/${ARCH}/",
  },

  "contacts" => {
    "hostmaster" => "unhollow@gmail.com",
    "cron" => "unhollow@gmail.com"
  },
})
