db_master = node[:scalarium][:roles]['db-master'][:instances].keys.first
template "/etc/phpmyadmin/config-db.php" do
  source "config-db.php.erb"
  mode "0660"
  variables(:password => node[:mysql_server_root_password], :username => 'root', :host => (node[:scalarium][:roles][:redis][:instances][db_master][:private_dns_name] rescue nil) )
end