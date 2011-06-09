# Deploy an example Drupal site.
# TODO Move this to a definition with parameters.
require_recipe "mysql"
require_recipe "drush"
require_recipe "drush_make"

# Add an admin user to mysql
execute "add-admin-user" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
      "GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'localhost' IDENTIFIED BY 'myadmin' WITH GRANT OPTION;" +
      "GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'%' IDENTIFIED BY 'myadmin' WITH GRANT OPTION;\" " +
      "mysql"
  action :run
end

# TODO: Break this out into a vagrant only cookbook? (name: "drupal-vagrant")
# create a drupal db
execute "add-drupal-db" do
  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
      "CREATE DATABASE drupal;\""
  action :run
  ignore_failure true
end

# drush make a default drupal site example
bash "install-default-drupal-makefile" do
  code <<-EOH
(mkdir -p /vagrant/public/drupal.vbox.local)
  EOH
  not_if { File.exists?("/vagrant/public/drupal.vbox.local/example.make") }
end

# Copy make file to site.
# TODO Fetch this file online?
# TODO Does this overwrite?
cookbook_file "/vagrant/public/drupal.vbox.local/example.make" do
  source "example.make"
  notifies :restart, resources("service[apache2]"), :delayed
end

# drush make a default drupal site example
bash "install-default-drupal-site" do
  code <<-EOH
(cd /vagrant/public/drupal.vbox.local; drush make example.make www)
  EOH
  not_if { File.exists?("/vagrant/public/drupal.vbox.local/www/index.php") }
end

cookbook_file "/vagrant/public/drupal.vbox.local/www/sites/default/settings.php" do
  source "settings.php"
  notifies :restart, resources("service[varnish]"), :delayed
end
