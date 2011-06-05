Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "base"
  # config.vm.boot_mode = :gui

  config.vm.customize do |vm|
    vm.memory_size = 1024
  end
  config.vm.network("33.33.33.10")
  config.vm.share_folder("v-root", "/vagrant", ".")
  # config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  # config.vm.share_folder("v-apt", "/var/cache/apt", "~/temp/vagrant_aptcache/apt", :nfs => true)

  config.vm.provision :chef_solo do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["drupal-chef/cookbooks/site-cookbooks", "drupal-chef/cookbooks/drupal-cookbooks"]
    chef.roles_path = "drupal-chef/roles"
    chef.add_role("base")
  end
end
