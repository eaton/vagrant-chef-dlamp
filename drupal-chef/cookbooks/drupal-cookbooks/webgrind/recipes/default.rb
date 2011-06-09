# Retrieve webgrind for xdebug trace analysis.

package 'subversion'

subversion "Webgrind" do
  repository "http://webgrind.googlecode.com/svn/trunk/"
  revision "HEAD" #Wonder if there is a stable tag?
  destination "/var/www/webgrind"
  action :sync
end

# vhost? web_app?
