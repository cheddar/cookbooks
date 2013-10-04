description "base role for all nodes"

run_list(%w(
  recipe[base]
))

override_attributes({
  :portage => {
    :SYNC => "rsync://mirror.zenops.net/zentoo-portage-next",
  },
})
