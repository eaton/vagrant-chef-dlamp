# What
VirtualBox Vagrant Chef Drupal install


# How
1. Download and Install [VirtualBox](http://www.virtualbox.org/) (ensure you are on the latest version 4.0.8+)
2. Install [vagrant](http://vagrantup.com/v1/docs/getting-started/index.html)
3. Download or Clone this project go to the folder and launch the box:
    `cd [vagrant project directory];
    vagrant up`
4. Add this line to your /etc/hosts (or windows equivalent):
    `10.0.0.10        dev-site.dev`
5. Drink a big kombucha while you listen to a Diamond Rings EP on vinyl, because clearly you're a giant hipster.

That's it, files in "public" are served at the URL specified in the Vagrantfile [http://dev-site.dev/](http://dev-site.dev and if you have a new MySQL database and drop a copy of Drupal into the public directory, you'll be ready to go.

To connect to the console of you instance:
    `vagrant ssh` 

As an alternative to Step 4, you can configure your OSX box to use dnsmasq and never have to fiddle with the file /etc/hosts ever again! In this example the TLD ".dev" is used. You could change this to another TLD if you preferred, such as .local, or .vm.

1. Download and install [homebrew](http://brew.sh) if you haven't already. 
2. $ brew install dnsmasq

Create and configure a dnsmasq configuration file (ensure the IP address and TLD match the settings in your Vagrantfile):
3. $ mkdir -pv $(brew --prefix)/etc/
4. $ echo 'address=/dev/10.0.0.10' > $(brew --prefix)/etc/dnsmasq.conf

Ensure dnsmasq is launched when the host computer boots:
5. $ sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
6. $ sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

Update the DNS resolution configuration files (ensure the IP address matches the adddress in Vagrantfile):
7. $ sudo mkdir -v /etc/resolver
8. $ sudo bash -c 'echo "nameserver 10.0.0.10" > /etc/resolver/dev'

At this point you may need to reboot your computer to see the changes to your DNS settings.
 
# Why
This project is based on the [Vagrant Project](http://drupal.org/project/vagrant) on Drupal.org, but includes a number of tweaks.

1. Instead of provisioning a Drupal site using Chef, it simply sets up Apache to serve incoming requests from the shared Vagrant public directory. It assumes that you'll be maintaining one VM for each simulated multisite instance.
2. It doesn't install PHPMyadmin, because that makes baby Jesus cry. If you need to poke at the DB, use a tool like [Sequel Pro](http://www.sequelpro.com/), and log into the DB over the Vagrant SSH connection.
3. It installs Drush 5.7 via PEAR instead of a custom Chef recipe. Because lazy.

--------

You can add `XDEBUG_PROFILE` to your GET parameter to generate an xdebug profile, e.g. [http://dev-site.vbox.dev/?XDEBUG_PROFILE](http://dev-site.vbox.dev/?XDEBUG_PROFILE)

You can then investigate at [http://dev-site.dev/webgrind/](http://dev-site.dev/webgrind/)


## Other projects of interest

*  [https://github.com/msonnabaum/drupalcon-training-chef-repo](https://github.com/msonnabaum/drupalcon-training-chef-repo)
*  [http://drupal.org/sandbox/mbutcher/1356522](http://drupal.org/sandbox/mbutcher/1356522)
*  [http://drupal.org/project/drush-vagrant](http://drupal.org/project/drush-vagrant)
