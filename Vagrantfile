Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid32"
  # config.vm.boot_mode = :gui

  # Memory setting for Vagrant < 0.90
  # config.vm.customize do |vm|
  #   vm.memory_size = 1024
  # end

  # Memory setting for Vagrant >= 0.90
  config.vm.customize ["modifyvm", :id, "--memory", "1024"]

  # Network setting for Vagrant < 0.90
  # config.vm.network("33.33.33.10")

  # Network setting for Vagrant >= 0.90
  config.vm.network :hostonly, "33.33.33.10"
  config.vm.forward_port(80, 80)
  config.vm.forward_port(3306, 3306)

  # On windows machines, NFS isn't supported. Will include some commented-out non-NFS
  # lines later.
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => TRUE)

  config.vm.provision :chef_solo do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["cookbooks/site-cookbooks", "cookbooks/drupal-cookbooks"]
    chef.roles_path = "roles"

    # This role represents our default Drupal development stack.
    chef.add_role("drupal_lamp_dev")

    chef.json.merge!({
        :www_root => '/vagrant/public',
        :mysql => {
          :server_root_password => "root", # TODO Hardcoded MySQL root password.
          :allow_remote_root => true,
          :bind_address => "0.0.0.0"
        },
        :hosts => {
          :localhost_aliases => ["dev-site.vm"]
        },
			  :drush => {
				  :install_method => 'pear',
				  :version => '5.7.0',
			  }
      })
  end
end
