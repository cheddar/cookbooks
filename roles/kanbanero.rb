description "Kanbanero Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :backup => {
    :encryption_password => "V9RaKs1DaeoX1PJY0aAqWaj8wgDQM8",
    :target_base_url => "ssh://backup:6hktyzGQOyTBGNzegT90Y8TUAavC55@backup.madvertise.net/backup",
  },

  :mysql => {
    :backup => {
      :mode => "stream",
      :stream => {
        :host => "dbbackup@backup.madvertise.net",
      },
    }
  }
})
