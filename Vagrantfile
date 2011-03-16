Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "base"

  config.vm.customize do |vm|
    vm.memory_size = 1536
  end

  config.vm.provision :chef_solo do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe("vagrant_main")
    chef.json.merge!({
      :mysql => {
        :server_root_password => "root"
      }
    })
  end

  config.vm.network("33.33.33.10")
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)

end

