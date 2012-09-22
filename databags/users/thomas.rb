comment "Thomas Hille"
email "thomas.hille@madvertise.com"

nodes({
  "kanbanero.com" => {
    :tags => %w(hostmaster),
  },
  "iberico.kanbanero.net" => {
    :tags => %w(hostmaster),
  },
  "app1.kanbanero.net" => {
    :tags => %w(hostmaster),
  },
  "staging.kanbanero.net" => {
    :tags => %w(hostmaster),
  },
})

authorized_keys [
"ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyJhUuCwViAh0hOYwcD9VOHuNjg0Bg9u2uk4VdAPsORqsHu7kqsWMnlRO47wTWWhgqgHsj59XogcwiprIOSXlMqjdyDo/PsMhr4yMu699Rw67wNo8YDdYag/78rDJ6xKClF2QpTTYe8CgzV0FRYWoeV/mo3dc+ALwBgdrYceAGOUFy0NHhvLlY/Go9E8ZnoGoUKYn9h+lyPjiP97g1LloOQ5oCaV58INPmpm4JfiRGiQ7HFCMUDmZdFpwJBpcx/Q/2FhTAJLWmSEEQpq8izs/pejedMdSTc4j2v4XyvdQ0Uk2Ypt4OClFpeg1926p6pYIHTF0MHzXtUVT1wl+qpGRgQ== thomas_hille@localhost"
]
