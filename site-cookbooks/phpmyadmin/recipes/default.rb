directory "/etc/dbconfig-common/" do
  action :create
  recursive true
end

template "/etc/dbconfig-common/phpmyadmin.conf" do
  source "phpmyadmin.conf.erb"
  mode "0660"
end

package "phpmyadmin"

template "/etc/apache2/sites-enabled/zzz-phpmyadmin" do
  source "vhost.erb"
  mode "0660"
end

template "/etc/phpmyadmin/apache.conf" do
  source "apache.conf.erb"
  mode "0660"
end

template "/etc/phpmyadmin/config-db.php" do
  source "config-db.php.erb"
  mode "0660"
  variables(:password => node[:mysql_server_root_password], :username => 'root', :host => '127.0.0.1' )
end
