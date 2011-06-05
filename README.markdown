# What
VirtualBox Vagrant Chef Drupal install on a LAMP server


# How
1. Download and Install [VirtualBox](http://www.virtualbox.org/)
2. Make sure you update your gems:
    `(sudo) gem update --system`
3. Install [vagrant](http://vagrantup.com/):
    `(sudo) gem install vagrant`
4. Download a vagrant box:
    `vagrant box add base http://files.vagrantup.com/lucid32.box`
5. Download or Clone this project
6. Go to this folder and launch the box:
    `cd [vagrant project directory];
    vagrant up`
7. Add this line to your /etc/hosts (or windows equivalent):
    `33.33.33.10  drupal.vbox.local dev-site.vbox.local`


That's it, files in "public" are served here : [http://drupal.vbox.local/](http://drupal.vbox.local/)

To connect to the console of you instance:
    `vagrant ssh`

--------

You can add `XDEBUG_PROFILE` to your GET parameter to generate an xdebug profile, e.g. [http://dev-site.vbox.local/?XDEBUG_PROFILE](http://dev-site.vbox.local/?XDEBUG_PROFILE)

You can then investigate at [http://dev-site.vbox.local/webgrind/](http://dev-site.vbox.local/webgrind/)

Phpmyadmin is available [http://dev-site.vbox.local/phpmyadmin/](http://dev-site.vbox.local/phpmyadmin/). User `myadmin`, Password `myadmin`

