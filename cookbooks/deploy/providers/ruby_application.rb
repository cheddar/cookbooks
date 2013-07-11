include ChefUtils::Account

action :create do
  nr = new_resource # rebind
  user = get_user(nr.user)
  homedir = user[:dir]

  deploy_rvm_ruby user[:name] do
    rvm_version nr.rvm_version
    ruby_version nr.ruby_version
  end

  deploy_branch homedir do
    repository nr.repository
    revision nr.revision
    user nr.user

    action :force_deploy if nr.force

    symlinks nr.symlinks
    symlink_before_migrate nr.symlink_before_migrate

    before_symlink do
      rvm_shell "#{nr.user}-bundle-install" do
        code "bundle install --path #{homedir}/shared/bundle --quiet --deployment --without '#{[nr.bundle_without].flatten.join(' ')}'"
        cwd release_path
        user nr.user
      end

      callback(:after_bundle, nr.after_bundle)
    end

    before_restart nr.before_restart
  end
end
