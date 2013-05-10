description "Kanbanero Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :contacts => {
    :hostmaster => "hostmaster@kanbanero.com",
  },

  :backup => {
    :encryption_password => "V9RaKs1DaeoX1PJY0aAqWaj8wgDQM8",
    :target_base_url => "ftp://u54761:E6zVrffyU1Jc3vgf@u54761.your-backup.de/",
  },

  :mysql => {
    :server => {
      :bind_address => "0.0.0.0",
    },
    :backup => {
      :mode => "copy",
    }
  }
})
