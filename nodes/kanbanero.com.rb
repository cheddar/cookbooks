set[:primary_ipaddress] = "188.40.132.123"

set[:backup][:encryption_password] = "V9RaKs1DaeoX1PJY0aAqWaj8wgDQM8"
set[:backup][:target_base_url] = "ssh://backup:6hktyzGQOyTBGNzegT90Y8TUAavC55@backup.madvertise.net/backup"
set[:backup][:configs]["kanbanero-db"][:source] = "/var/app/kanbanero/shared/db"

run_list(%w(
  role[base]
  recipe[kanbanero]
))
