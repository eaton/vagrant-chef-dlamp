Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. For a detailed explanation
  # and listing of configuration options, please view the documentation
  # online.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  # config.vm.boot_mode = :gui

  Vagrant.require_version ">= 1.5.2"

  # Memory setting
  config.vm.provider "virtualbox" do |vb|
    vb.customize([
      'modifyvm', :id,
      '--memory', '1024',
      '--natdnshostresolver1', 'on',
    ])
  end

  # Network setting for Vagrant
  config.vm.network "private_network", type: "dhcp"
  config.vm.network :forwarded_port, host: 80, guest: 80, auto_correct: true
  config.vm.network :forwarded_port, host: 3306, guest: 3306, auto_correct: true

  # Try to use NFS only on platforms other than Windows
  nfs = !Kernel.is_windows?
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.vm.provision :chef_solo do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["cookbooks/site-cookbooks", "cookbooks/drupal-cookbooks"]

    # Make sure to update apt-cache
    chef.add_recipe "apt"

    chef.add_recipe("vim")

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
          :version => '6.0',
        }
      })
  end
end

# Returns true if we are running on a MS windows platform, false otherwise.
def Kernel.is_windows?
  processor, platform, *rest = RUBY_PLATFORM.split("-")
  platform == 'mswin32' || platform == 'mswin64' || platform == 'mingw32' || platform == 'mingw32'
end
