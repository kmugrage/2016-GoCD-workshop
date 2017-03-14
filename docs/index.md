# GoCD Workshop Setup

This instructions will set up a GoCD server and 3 GoCD agents to be used for the GoCD Workshop. There are two options below, Digital Ocean in the cloud or Virtualbox on your local machine. Either option requires [Vagrant](https://www.vagrantup.com/), [Git](https://git-scm.com/), and SSH.

## Instructions

### Important notes

* Text that is shown `in a white box` represents commands to be typed into a terminal. These are almost always case sensitive. This is done primarily so that you don't have add your private information to the setup scripts.
* Text in `[SQUARE BRACES]` represents text you'll need to replace with the appropriate values for your account.
* At this time, these instructions are not valid for Windows.

### Required setup for either option

* Install [Vagrant](https://www.vagrantup.com/)
* Install [Git](https://git-scm.com/)
* You'll need SSH, no link provided as there are many distributions and most operating systems already have it.
* Clone the repository at [https://github.com/gocd-demo/GoCD-workshop-setup](https://github.com/gocd-demo/GoCD-workshop-setup) by typing

  `git clone https://github.com/gocd-demo/GoCD-workshop-setup`

  in a terminal.

### Option 1: Using Digital Ocean (recommended to avoid local machine and bandwidth issues)

This uses a 2GB Digital Ocean Droplet. __At the time of this writing, the cost of this droplet size is $20 a month / $0.030 per hour.__ Despite being more setup, this option is much faster. The actual installation is happening on the public cloud instead of downloading to your machine.

#### Set Up SSH keys

This will allow Vagrant to provision the new machine, as well as allow you to connect to it more easily.

* [Click here for SSH key instructions](basic.md)

#### Set Up API Token

This will allow Vagrant to create machines on your behalf.

* Go to [https://cloud.digitalocean.com/settings/api/tokens](https://cloud.digitalocean.com/settings/api/tokens) and click on Generate New Token
* Copy the token and save it to a safe place like an encrypted password store. You'll need it later, and Digital Ocean won't show it to you again. __Anyone with this token can create droplets on your Digital Ocean account.__
* In a terminal, type

  `export DIGITAL_OCEAN_KEY='[YOUR_KEY]'`

  For example, if your token is '123456789' you'll type `export DIGITAL_OCEAN_KEY='123456789'`

  * Note: typing this into the terminal this way will set that value as an environment variable for as long as this terminal is active. It will not work in any other terminals you launch or after you close the one you're using now. If you'd like this key to be persistent you'll need to add an [environment variable](https://en.wikipedia.org/wiki/Environment_variable) to your system.

#### Start the machine

* If you're not already, change directory to the Git repository you checked out earlier. Eg: `cd GoCD-workshop-setup`

* Install the Vagrant plugin for Digital Ocean

  `vagrant plugin install vagrant-digitalocean`

* Rename Vagrantfile.digitalocean to Vagrantfile

  `mv Vagrantfile.digitalocean Vagrantfile`

* Type `vagrant up` in your terminal.

* When complete, use your web browser to go to [https://cloud.digitalocean.com/droplets](https://cloud.digitalocean.com/droplets)

* Copy the IP address of your new machine.

* Go to http://[YOUR_IP_ADDRESS]:8153/ in a web browser. For example, http://192.168.0.1:8153/
  * Note: It may be several minutes before GoCD is available.

### Option 2: Using Virtualbox for local installation

This method will install set up a virtual machine on your computer with a GoCD server and agents.

Pro:

* You don't need a Digital Ocean account
* There's no cost to you to run the machine
* Your environment is available offline

Con:

* This option is __much__ slower to set up on most networks since everything is being downloaded to your machine
* This option requires a minimum of 8GB of ram on the local machine, and more is recommended

Requires Vagrant and Virtualbox

1. Clone this repository
2. Rename Vagrantfile.virtualbox to Vagrantfile
3. Run 'vagrant up' (this will take a while, it builds most of the box)
4. Go to http://localhost:8153/
