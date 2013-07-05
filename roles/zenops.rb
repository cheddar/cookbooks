description "ZenOps Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :contacts => {
    :hostmaster => "hostmaster@zenops.de",
  },

  :backup => {
    :encryption_password => "wNOfCjcnBIXoBJ1C12Sc8PeNVBWD4n9t",
    :target_base_url => "ftp://u69386:OKoLCCrf3ePj3Qi0@u69386.your-backup.de/",
  },

  :mysql => {
    :backup => {
      :mode => "copy",
    }
  },
})
