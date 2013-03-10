comment "Eugen Martin"
email "eugen@admineo.de"

nodes({
  "app1.admineo.de" => {
    :tags => %w(hostmaster),
  },
})

authorized_keys [
'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsEvKWJmmPoZWpeJVwPxOJgo+IHeD6AfT5dGXNJDE6GedzkP2Fh6XGIAQhWI8v0UKAR99DYVIcu7ozcDoNIUNO1DH0Nz5mv3NiGj+Vj0oT8cDmEdFmgAbcV6Ew+1yauUtdbpFS8ujeYCnLaHmlvtD3gTVMDdtHfl9hXYBocGveHHrpBNZdnR3E9RmTRIsw2uMXirKIZP4xq2o8WIob8vgvzB5BGY/bdGDgOs5VyugKAGVf+q2Aqhzb8r91GEEid0faXtLrWGCLD2WcGRz058Lbk439MCOo1gAvabT2KAcBY5qP2r/kG8Q3ipyzrkio/2oMH718DGPq4OR0Eb1yWe9PQ== eugen@schnubbi.local',
]
