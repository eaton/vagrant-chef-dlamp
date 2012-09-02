Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "base"
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

  config.vm.share_folder("v-root", "/vagrant", ".")
  # config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  # config.vm.share_folder("v-apt", "/var/cache/apt", "~/temp/vagrant_aptcache/apt", :nfs => true)

  config.vm.provision :chef_solo do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["cookbooks/site-cookbooks", "cookbooks/drupal-cookbooks"]
    chef.roles_path = "roles"

    # This role represents our default Drupal development stack.
    chef.add_role("drupal_lamp_varnish_dev")
    # Install an example D7 install at drupal.vbox.local.
    chef.add_recipe('drupal::example')
    # This is basically the Vagrant role.
    chef.json.merge!({
        :www_root => '/vagrant/public',
        :mysql => {
          :server_root_password => "root" # TODO Hardcoded MySQL root password.
        },
        :hosts => {
          :localhost_aliases => ["drupal.vbox.local", "dev-site.vbox.local"]
        }
      })
  end
end
