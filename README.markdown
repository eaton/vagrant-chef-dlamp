What
====
Vagrant/Chef files for a LAMP server

How
===
1. Install [vagrant](http://vagrantup.com/)
    gem install vagrant
2. Download and Install [VirtualBox](http://www.virtualbox.org/)
3. Download a vagrant box (name of the box is supposed to be lucid32)
    vagrant box add base http://files.vagrantup.com/lucid32.box
4. Clone this repo
5. Go to the repo and launch the box
    cd [repo]
    vagrant init
    vagrant up
6. Add this line to your /etc/hosts (or windows equivalent)
    33.33.33.10 dev-site.vbox.local

That's it, the file in [repo]/public/ are served here : [http://dev-site.vbox.local/](http://dev-site.vbox.local/)

To connect to the console of you instance:
    vagrant ssh

You can add `XDEBUG_PROFILE` to your GET parameter to generate an xdebug profile, e.g. [http://dev-site.vbox.local/?XDEBUG_PROFILE](http://dev-site.vbox.local/?XDEBUG_PROFILE)

You can then investigate at [http://dev-site.vbox.local/webgrind/](http://dev-site.vbox.local/webgrind/)

Phpmyadmin is available [http://dev-site.vbox.local/phpmyadmin/](http://dev-site.vbox.local/phpmyadmin/). User `myadmin`, Password `myadmin`
