comment "QualityPark"
email "supportbs@qualitypark.de"

nodes({
  "web1.bohmeyer-schuster.com" => {
    :tags => %w(hostmaster),
  },
  "web2.bohmeyer-schuster.com" => {
    :tags => %w(hostmaster),
  },
  "nepal.bohmeyer-schuster.com" => {
    :tags => %w(hostmaster),
  },
})

authorized_keys [
'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAh4F1pi15/7dNE+5lbPbStmS7eiadmBt4VCft6qP7iaGfchZawth+B3a/ov0MC3F4PIQgRYVs8c7HdzROjeWwgNX/mc3b7zrSb3OKCLOCg6Fbtyn3PSU7esV5OiSu+EOWsKyT9Cp1zjjB8NvJsPPKGFsFtHEdRyJMJIhI9uBD2XrIdg3PBLlUr+EPtXyiik7dQ6z2VsFXcJIl2pGiw5coNjER/XQxU1WueAPaDPfmx4cSGtF6vJTTnsctITCz0zTYa2TOP9ZNKGI3shS420bPN1vx8d/X6gT+Iigim0ZeHuureDgf9NZJkNxc+Mi4ju4HDq/Uxq6JYmRvF/hegNILKw== rsa-key-20130927-schumacher',
'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAuvBepHFnLBbgoHpfTcHx17J1+2WBhZ1vJliX8W/rb2Lf3lGKpt7ZLR3oY4i2lRNtMUcjOYRt8IjO9e+mrH8fTgVVP4aQcKJFEpzfuMCAXkyVEZ5/tMVd46K27C4o/7iPRa1kTnVcGYQiTlDtzelhMVVk8PN+0J0J0pjmIj1Gd8SDkOS8RVGjUzGlnHCtEwdDxE/XJ3duSr8EtOI+0mh7hpEUZPc/XxnKnPZMvbW9AIh0y05y/HWBJBYwVjPz1MIiWX183ywGJxMqWNIF7GMtfau/lk7+9oFbt6C2v2zzz0VXfo+3lBd4UnWIGVI8bASA94wQPKpZGl0B0VBVEUEpPw== rsa-key-20130927-cochu',
'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmdnOq4ML1Ja/d8rZzXV1QsAZcgBUCeuSN+QMx/t4k+X3xRXj7EZwf8cSzLfSWW72/cNis5H5gY0xnfe8QJRzjxb4oLbKi3V6uAEQmMa0atEZJY0s1NfVENmTfHAxFvzJuxbUUawaq3jVQyMbiGnWOQFVgNG6wKtPt8qzuurcepsBHjj7o3XxPu5thDDrrm8ONjNYJ5zAf09LDOsSmC5vM7aFnUjLFzASJ/w7syNiE0buRIWhrSMQrd+wkiJMWXQAQU/BwOIyhrAt8Tp4/s37To8ReJ7fOpxrhZ5BTiLNZ1cNpq0doAZgwo8CrFg4Fo5NXyW5On0EPcnGWXyJJH7e8w== rsa-key-20130927-henke',
'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAjw4Pi5tW826/Y178YeHoTks2vk+GGBeZptC8ZmTLrDG053MectuSt5jwnxwxjPTSDa4kaKsRmT8ow/MZOkQpNKGOAGWjnMQtqozKyog8AezrjTo5zg/7zqsQNmZdDinGyrGLrMiOq/AGJhiiAR5ciTY02gQyQqvjPC5rnw5LUF4S1CH+62BJvUbOYhuvX6AIB7rIKzukKbTaOuloDrnnUP+v9z/7+Trrtv47XB7fDV6qroHLTI1hEzghrDCJZ7brAcCLjIweIH9yPqhNUfH+ZvpPQ1FpRPL0jzQML6qOkI26og3j7WSftUNXnNfCD0sfx1b0kaOZQdNeXyD3kCf1rQ== rsa-key-20130927-krahmann',
]
