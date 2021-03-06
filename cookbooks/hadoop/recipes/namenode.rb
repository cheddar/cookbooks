include_recipe "hadoop"

execute "hadoop-namenode-format" do
  command "/opt/hadoop/bin/hadoop namenode -format"
  user "hadoop"
  group "hadoop"
  creates "/var/lib/hadoop/name/image/fsimage"
  only_if { vagrant? }
end

service "hadoop@namenode" do
  action [:enable, :start]
  subscribes :restart, 'template[/opt/hadoop/conf/hdfs-site.xml]'
end

## Hadoop Balancer cronjob:
cron "hadoop_balancer" do
  minute "0"
  hour "3"
  day "*"
  command "/opt/hadoop/bin/start-balancer.sh"
  action :create
end

if nagios_client?
  {
    :nodes => [:NameNode, nil, nil],
    :state => [:Dfs, nil, nil],
    :capacity => [:DfsCapacity, 75, 90],
    :blocks => [:DfsBlocks, 50, 100],
  }.each do |name, params|
    name = name.to_s

    nrpe_command "check_hdfs_#{name}" do
      command "/usr/lib/nagios/plugins/check_hdfs -m #{params[0]} -u http://localhost:50070/jmx -w #{params[1]} -c #{params[2]}"
    end

    nagios_service "HDFS-#{name.gsub(/_/, '-').upcase}" do
      check_command "check_nrpe!check_hdfs_#{name}"
      servicegroups "hadoop"
    end
  end
end
