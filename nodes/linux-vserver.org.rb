set[:primary_ipaddress] = "188.40.228.147"

set[:skip][:postfix_satelite] = true

set[:portage][:USE] = [
  "-ruby_targets_ruby18",
  "-php_targets_php5-3",
  "php_targets_php5-4",
]

run_list(%w(
  recipe[base]
))