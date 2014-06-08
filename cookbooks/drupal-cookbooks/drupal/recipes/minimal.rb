# Install somewhat minimal tools to run Drupal, not including a specific HTTP server or PHP.
# build-essential needed for PECL.
include_recipe "build-essential"

pkgs = value_for_platform(
  [ "centos", "redhat", "fedora" ] => {
    "default" => %w{ pcre-devel php-mcrypt }
  },
  [ "debian", "ubuntu" ] => {
    "default" => %w{ libpcre3-dev php5-mcrypt }
  },
  "default" => %w{ libpcre3-dev php5-mcrypt }
)

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

php_pear "pdo" do
  action :install
end

# Install APC for increased performance. rfc1867 support also provides minimal
# feedback for file uploads.  Requires pcre library.
php_pear "apc" do
  directives(:shm_size => "70M", :rfc1867 => 1)
  version "3.1.6" # TODO Somehow Chef PEAR/PECL provider causes debugging to be enabled on later builds.
  action :install
end

# Install uploadprogress for better feedback during Drupal file uploads.
php_pear "uploadprogress" do
  action :install
end
