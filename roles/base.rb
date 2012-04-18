description "base role for all nodes"

run_list(%w(
  recipe[base]
  recipe[duply]
  recipe[postfix::satelite]
  recipe[chef::client]
))

default_attributes({
  :contacts => {
    :hostmaster => "unhollow@gmail.com",
    :cron => "unhollow@gmail.com"
  },

  :postfix => {
    :relayhost => "mx.zenops.net",
  },

  :ssh => {
    :additional_host_keys => [
      "backup.madvertise.net,89.238.82.131 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3O1MiEj+tenIaizj7G4GpuDdv/Nma3n8mMlb6uFhPWPqZR5++9KRWFGV1PuJUaWUjH+ezFz2hcxSbcr/lquMk2EG2XYutrVqxFx84vcaZdTZLkctr5/qHQvJBQLzgq4yQbm1ZVa0gloKW0eZNKWpWSQzTcadvfYz3LffOTPRLO/7Rgn/ZyJNzJuOaE8Lzr8D7Z42eiN5UXCgEzKpdv3Tv/vpJGcf68PyPbQkEGvDd8OcrtDDvl4r2du9vOMq/YuQ+RhbL0f/03RDplBQFynJfPXhSi4LeNIb4ffZp+RK3fnABOSfKOeGn54BW2MGPIlN0tM5bmq4cyM0r5wcPpcPN",
    ],
  },
})
