require_recipe "apt"
require_recipe "mysql::server"
require_recipe "php"
require_recipe "php::module_curl"
require_recipe "php::module_gd"
require_recipe "php::module_mysql"
require_recipe "php::module_memcache"
require_recipe "apache2"
require_recipe "apache2::mod_php5"
require_recipe "apache2::mod_rewrite"
require_recipe "apache2::mod_expires"
require_recipe "varnish"
require_recipe "memcached"
require_recipe "imagemagick"
require_recipe "build-essential"
require_recipe "hosts"
require_recipe "drush"
require_recipe "xhprof"
require_recipe "phpmyadmin"

# Some neat package (subversion is needed for "subversion" chef ressource)
%w{ nfs-common debconf subversion curl git-core }.each do |a_package|
  package a_package
end

# get phpmyadmin conf
cookbook_file "/tmp/phpmyadmin.deb.conf" do
  source "phpmyadmin.deb.conf"
end
bash "debconf_for_phpmyadmin" do
  code "debconf-set-selections /tmp/phpmyadmin.deb.conf"
end
package "phpmyadmin"

node[:hosts][:localhost_aliases].each do |site|
  # Configure the development site
  web_app site do
    template "sites.conf.erb"
    server_name site
    server_aliases [site]
    docroot "/vagrant/public/#{site}/www"
  end
end

template "#{node[:varnish][:default]}" do
  source "varnish-template-ubuntu-default.erb"
  owner "root"
  group "root"
  mode 0644
end

php_pear "pdo" do
  action :install
end

# Requried to install APC.
package "libpcre3-dev"

# Install APC.
php_pear "apc" do
  directives(:shm_size => 70)
  version "3.1.6" #ARGH!!! debuging enabled on APC builds circa 5/2011. Pin back.
  action :install
end

php_pear "xdebug" do
  action :install
end

# Retrieve webgrind for xdebug trace analysis
subversion "Webgrind" do
  repository "http://webgrind.googlecode.com/svn/trunk/"
  revision "HEAD"
  destination "/var/www/webgrind"
  action :sync
end

# Add an admin user to mysql
execute "add-admin-user" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
      "CREATE USER 'myadmin'@'localhost' IDENTIFIED BY 'myadmin';" +
      "GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'localhost' WITH GRANT OPTION;" +
      "CREATE USER 'myadmin'@'%' IDENTIFIED BY 'myadmin';" +
      "GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'%' WITH GRANT OPTION;\" " +
      "mysql"
  action :run
  ignore_failure true
end
