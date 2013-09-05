comment "Giacomo Vergnano"

nodes({
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
'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCepCCPTRah42bj04PsoKnP6HIcam01BIe/UXdeT7CdciUAC+M5rHONAzQjJI4D6AarWDPvWPQzbEkIENylj6L8TfT6puuBzTn5OqPJpEDgb0XJNYsSHhZii+xIJB0O0z7Uji8sbNXpz25s6l5mKs+Yc5jMWEZ+QrSAXnb3BySJkQr/WGcpT0hrCJtaRj7gL2hwJGVvB9tj2zQjYA6jat9lFPcw7hty7OQ2PdP9mNoXHaSdDQSD3/QC1M5YXyuAJYZoL/u3vXwWxnPv/mWfcLMX7ggjSh3em0AtET3lgxJd0MLaeOjQvYo73hHFaxSvcepPIcTCIV0ChLZotlrn/kt giacomo.vergnano@madvertise.com',
]
