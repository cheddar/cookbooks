description "Kanbanero Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :backup => {
    :encryption_password => "V9RaKs1DaeoX1PJY0aAqWaj8wgDQM8",
    :target_base_url => "ftp://u54761:E6zVrffyU1Jc3vgf@u54761.your-backup.de/",
  },

  :mysql => {
    :backup => {
      :mode => "copy",
    }
  }
})
