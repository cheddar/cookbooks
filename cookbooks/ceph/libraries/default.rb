require 'json'

def get_mon_nodes(extra_search=nil)
  nodes = []

  if node[:tags].include?('ceph-mon')
    nodes << node
  end

  nodes += node.run_state[:nodes].select do |n|
    n[:tags].include?("ceph-mon") and
      n[:ceph][:fsid] == node[:ceph][:fsid]
  end

  nodes
end

def get_mon_addresses()
  get_mon_nodes.map do |node|
    "#{node[:ipaddress]}:6789"
  end.uniq
end

QUORUM_STATES = ['leader', 'peon']

def have_quorum?()
  # "ceph auth get-or-create-key" would hang if the monitor wasn't
  # in quorum yet, which is highly likely on the first run. This
  # helper lets us delay the key generation into the next
  # chef-client run, instead of hanging.
  #
  # Also, as the UNIX domain socket connection has no timeout logic
  # in the ceph tool, this exits immediately if the ceph-mon is not
  # running for any reason; trying to connect via TCP/IP would wait
  # for a relatively long timeout.
  mon_status = %x[ceph --admin-daemon /var/run/ceph/ceph-mon.#{node[:hostname]}.asok mon_status]
  raise 'getting monitor state failed' unless $?.exitstatus == 0
  state = JSON.parse(mon_status)['state']
  return QUORUM_STATES.include?(state)
end
