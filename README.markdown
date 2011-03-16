What
====
Vagrant/Chef files for a LAMP server

How
===
1. Install [vagrant](http://vagrantup.com/)
    gem install vagrant
2. Download and Install [VirtualBox](http://www.virtualbox.org/)
3. Download a vagrant box (name of the box is supposed to be lucid32)
    vagrant box add base http://files.vagrantup.com/lucid32.
4. Clone this repo
5. Go to the repo and launch the box
    cd [repo]
    vagrant init
    vagrant up
6. Add this line to your /etc/hosts (or windows equivalent)
    33.33.33.10 www.dev-site.com dev-site.com dev.dev-site-static.com    

That's it, the file in [repo]/public/ are served here : [http://www.dev-site.com/](http://www.dev-site.com/)

You can add `XDEBUG_PROFILE` to your GET parameter to generate an xdebug trace, e.g. [http://www.dev-site.com/?XDEBUG_PROFILE](http://www.dev-site.com/?XDEBUG_PROFILE)

You can then investigate at [http://www.dev-site.com/webgrind/](http://localhost/webgrind/)

Phpmyadmin is available [http://www.dev-site.com/phpmyadmin/](http://localhost/phpmyadmin/). User `myadmin`, Password `myadmin`
