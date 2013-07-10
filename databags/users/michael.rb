comment "Michael Bohmeyer"
email "michael@admineo.de"

nodes({
  "app1.admineo.de" => {
    :tags => %w(hostmaster),
  },
  "web1.schilder-versand.com" => {
    :tags => %w(hostmaster),
  },
})

authorized_keys [
'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAudU6p6umYUu5q55rDyNc19XAazo6YeWI038W7KDHtUZbwWkacWwXk6ih3htWELNLf8+DeNbnKtidjLpPTYjDrlVl5tgspLP9m79rFY6WJmqN07gdJIP6a+dEYPF+Vu3JkSjOiJQYjj/7CgKPFAwVsY7xVSIL4XzzHYjXVExY7MP2kn3MPjFQUwpsNo52aixlIrUObgriYW5DgFdiLakQHZ5H0JFUlIqTOD+Y01s/IhZCGSnqeOv3hKTXAiZzB3maLDiD+CZa6rjis5HKDWDsVPCTFUX87NUaKgnse5F4KxgcSAvBhpLYSlHDrCZmrHsVuDUd3zPTmLUpBBmze97sYw== m.bohmeyer@schilder-versand.com',
]
