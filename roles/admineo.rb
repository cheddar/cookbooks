description "Admineo Servers"

run_list(%w(
  role[base]
))

override_attributes({
  :backup => {
    :encryption_password => "1aGHFRjGnc3NfCWi33HuDd1sjxsIj3uM",
    :target_base_url => "ftp://u63931:Yh8iV00R27ESXijl@u63931.your-backup.de/",
  },
})
