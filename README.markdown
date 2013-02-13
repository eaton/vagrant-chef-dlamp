# What
VirtualBox Vagrant Chef Drupal install


# How
1. Download and Install [VirtualBox](http://www.virtualbox.org/) (ensure you are on the latest version 4.0.8+)
2. Install [vagrant](http://vagrantup.com/v1/docs/getting-started/index.html)
3. Download or Clone this project go to the folder and launch the box:
    `cd [vagrant project directory];
    vagrant up`
4. Add this line to your /etc/hosts (or windows equivalent):
    `10.0.0.10        dev-site.local`
5. Alternately, use homebrew on your macbook air to install dnsmasq, and add the following line to your dnsmasq.conf file:
    `address=/.vm/10.0.0.10`
6. Drink a big kombucha while you listen to a Diamond Rings EP on vinyl, because clearly you're a giant hipster.


That's it, files in "public" are served here : [http://dev-site.local/](http://dev-site.local/), and if you have a new MySQL database and drop a copy of Drupal into the public directory, you'll be ready to go.

To connect to the console of you instance:
    `vagrant ssh` 

# Why
This project is based on the [Vagrant Project](http://drupal.org/project/vagrant) on Drupal.org, but includes a number of tweaks.

1. Instead of provisioning a Drupal site using Chef, it simply sets up Apache to serve incoming requests from the shared Vagrant public directory. It assumes that you'll be maintaining one VM for each simulated multisite instance.
2. It doesn't install PHPMyadmin, because that makes baby Jesus cry. If you need to poke at the DB, use a tool like [Sequel Pro](http://www.sequelpro.com/), and log into the DB over the Vagrant SSH connection.
3. It installs Drush 5.7 via PEAR instead of a custom Chef recipe. Because lazy.

--------

You can add `XDEBUG_PROFILE` to your GET parameter to generate an xdebug profile, e.g. [http://dev-site.vbox.local/?XDEBUG_PROFILE](http://dev-site.vbox.local/?XDEBUG_PROFILE)

You can then investigate at [http://dev-site.local/webgrind/](http://dev-site.local/webgrind/)


## Other projects of interest

*  [https://github.com/msonnabaum/drupalcon-training-chef-repo](https://github.com/msonnabaum/drupalcon-training-chef-repo)
*  [http://drupal.org/sandbox/mbutcher/1356522](http://drupal.org/sandbox/mbutcher/1356522)
*  [http://drupal.org/project/drush-vagrant](http://drupal.org/project/drush-vagrant)
