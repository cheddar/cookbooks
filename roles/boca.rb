description "Boca Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :backup => {
    :encryption_password => "NyI2ig6PRb5WRPkWg8LQ2YFT7zQSXwEo",
    :target_base_url => "ftp://u54739:PM8LNTf8ja4M8Wbf@u54739.your-backup.de/",
  },
})
