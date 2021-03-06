# remote commands for maintenance

namespace :rc do

  desc "Update gentoo packages"
  task :updateworld do
    search("platform:gentoo") do |node|
      env = "/usr/bin/env UPDATEWORLD_DONT_ASK=1" if ENV['DONT_ASK']
      system("ssh -t #{node.name} '/usr/bin/sudo -i #{env} /usr/local/sbin/updateworld'")
      reboot_wait(node.name) if ENV['REBOOT']
    end
  end

  desc "Update portage tree"
  task :sync do
    search("platform:gentoo") do |node|
      system("ssh -t #{node.name} '/usr/bin/sudo -i /usr/bin/eix-sync'")
    end
  end

  desc "Run chef-client"
  task :converge do
    search("*:*") do |node|
      system("ssh -t #{node.name} '/usr/bin/sudo -i /usr/bin/env LANG=en_US.UTF-8 /usr/bin/chef-client'")
    end
  end

  desc "Open interactive shell"
  task :shell do
    search("*:*") do |node|
      if ENV.key?('NOSUDO')
        system("ssh -t #{node.name}'")
      else
        system("ssh -t #{node.name} '/usr/bin/sudo -i'")
      end
    end
  end

  desc "Reboot machines and wait until they are up"
  task :reboot do
    search("default_query:does_not_exist") do |node|
      reboot_wait(node.name)
      puts "Sleeping 5 minutes to slow down reboot loop"
      sleep 5*60
    end
  end

  desc "Open iTerm cluster SSH"
  task :iterm do
    system("i2cssh #{search("hostname:chef").map(&:name).join(' ')}")
  end

  desc "Run custom script"
  task :script, :name do |t, args|
    script = File.join(TOPDIR, 'scripts', args.name)
    raise "script '#{args.name}' not found" if not File.exist?(script)
    search("*:*") do |node|
      if ENV.key?('NOSUDO')
        system("cat '#{script}' | ssh #{node.name} '/bin/bash -s'")
      else
        system("cat '#{script}' | ssh #{node.name} '/usr/bin/sudo -i /bin/bash -s'")
      end
    end
  end

  desc "Run custom command"
  task :cmd do
    raise "CMD must be supplied" if not ENV.key?('CMD')
    search("*:*") do |node|
      if ENV.key?('NOSUDO')
        system("ssh -t #{node.name} '#{ENV['CMD']}'")
      else
        system("ssh -t #{node.name} '/usr/bin/sudo -H #{ENV['CMD']}'")
      end
    end
  end
end
