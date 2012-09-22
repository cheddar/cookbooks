comment "Mike Szoernyi"
email "mike.szoernyi@googlemail.com"

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
  'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFTXezEvxMAZhH9hug1207hhu51bMNS6CVpmpmTTL7PdhEB0ikYllkpLe5oiI8ro/+UMqNXCUYbDMy7xNo1Wc48IWLbvlrC8VDreemABkkqYZh+NSIwyxAq9sBak/dfmcIfPDJRRh0zEs3n1xml985fSLWmVoRWHLcjee8P2aBB2oO08rs2fdtKLbSatyxSWZ118XFbyxR87fbbjNktcUVmdD6Iy+YCgK42FuZnZ2VyLuFUtENvHnKTAUpC0nMae7BDB210DI1FrG63aJzFHIm0RZrIn9Wh4wWNXfS/DpN49WJvTlE40rMZ11my8CDHDBrMJgjQXKxB4cRDtIcfeNB Mike (Work-Mac)',
'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUUmtepVWy7mX5n3b+0G0qBE8ixZjbG+8g+d688CqMNzeHB7vzOcj7MA5m+HnpZDCZqhPW84fMSsLONpfh8ZzishacUi/d+h0bLFYtodPkyENqVhB+63fScFuGo/YiClQTplyG6tSz02BInrjoONRACdyEVAzoGQER+QBYu5awonzQIedRND0QxPuFD+Y87sC4rnChxqIVghlRgmzc0OEK+rf9hPzO6c0Eg+F86TOFaDoTOtMOpRqh7X89UbMD3U2Su6GbqOuhW7ifjyC+eUVzwKtg61Hf1leVBYuvfBe+rOnwwSkQm39HDLhYZFnOz+uMXHlfhkM/Kc1ZdiIU+otd Mike (Home-Mac)'
]
