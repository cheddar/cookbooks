description "Schilderversand Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :contacts => {
    :hostmaster => "hostmaster@bohmeyer-schuster.com",
  },

  :backup => {
    :encryption_password => "zKoqy9IFQm39SKpTpfaXvmGAtBoTSRSe",
    :target_base_url => "ftp://u69446:VA4blFFIO8dkcE7T@u69446.your-backup.de/",
  },

  :php => {
    :max_input_vars => "50000",
    :register_globals => "On",
  },

  :mysql => {
    :backup => {
      :mode => "copy",
    }
  }
})
