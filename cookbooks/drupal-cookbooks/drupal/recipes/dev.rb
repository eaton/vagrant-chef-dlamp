# Install Drupal dev tools.
include_recipe "apt"
include_recipe "build-essential"

# Install Git, since Drupal devs probably need that.
package 'git-core'

php_pear "xdebug" do
  action :install
end

template "/etc/php5/apache2/conf.d/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources("service[apache2]"), :delayed
end
