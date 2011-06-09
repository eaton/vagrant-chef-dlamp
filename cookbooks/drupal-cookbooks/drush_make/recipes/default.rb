# Author:: Chris Christensen <chris@allplayers.com>
# Cookbook Name::  drush_make
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node[:platform]
when "debian", "ubuntu"
  bash "install-drush_make" do
    code <<-EOH
(cd /tmp; wget http://ftp.drupal.org/files/projects/drush_make-6.x-2.2.tar.gz)
(cd /tmp; tar zxvf drush_make-6.x-2.2.tar.gz)
(mkdir -p ~/.drush)
(cd /tmp; mv drush_make ~/.drush/)
    EOH
    not_if { File.exists?(File.expand_path("~/.drush/drush_make/drush_make.drush.inc")) }
  end
end
