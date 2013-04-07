description "base role for all nodes"

run_list(%w(
  recipe[base]
  recipe[duply]
))

override_attributes({
  :portage => {
    :SYNC => "rsync://rsync.zentoo.org/zentoo-portage-next",
  },
})
