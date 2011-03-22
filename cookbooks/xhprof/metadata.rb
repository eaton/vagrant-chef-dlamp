maintainer       "Mark Sonnabaum"
maintainer_email "mark.sonnabaum@acquia.com"
license           "Apache 2.0"
description       "Installs xhprof php extension from Brian Mercer's launchpad PPA"
version           "0.9"
depends           "php"

recipe "xhprof", "Installs xhprof php extension"

%w{ ubuntu }.each do |os|
  supports os
end
