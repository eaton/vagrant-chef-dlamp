maintainer       "Chris Christensen"
maintainer_email "chris@allplayers.com"
license          "Apache 2.0"
description      "Installs drush make"
version          "0.9.0"
depends           "drush"
recipe "drush_make", "Installs drush make"

%w{ debian ubuntu arch }.each do |os|
  supports os
end
