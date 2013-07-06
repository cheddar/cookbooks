description "Schilderversand Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :contacts => {
    :hostmaster => "hostmaster@schilder-versand.com",
  },

  :backup => {
    :encryption_password => "zKoqy9IFQm39SKpTpfaXvmGAtBoTSRSe",
    :target_base_url => "ftp://u69446:VA4blFFIO8dkcE7T@u69446.your-backup.de/",
  },

  :mysql => {
    :backup => {
      :mode => "copy",
    }
  }
})
