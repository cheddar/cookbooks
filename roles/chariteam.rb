description "Chariteam Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :contacts => {
    :hostmaster => "hostmaster@chariteam.de",
    :cron => "hostmaster@chariteam.de"
  },

  :backup => {
    :encryption_password => "zKoqy9IFQm39SKpTpfaXvmGAtBoTSRSe",
    :target_base_url => "ftp://u55208:ibAxmbHr5CNsSsyV@u55208.your-backup.de/",
  },

  :mysql => {
    :backup => {
      :mode => "copy",
    }
  }
})
