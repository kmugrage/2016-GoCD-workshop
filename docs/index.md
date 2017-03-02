# GoCD Workshop Setup

This instructions will set up a GoCD server and 3 GoCD agents to be used for the GoCD Workshop. There are two options below, Digital Ocean in the cloud or Virtualbox on your local machine. Either option requires [Vagrant](https://www.vagrantup.com/), [Git](https://git-scm.com/), and SSH.

## Setting Up

### Required software for either option

1. Install [Vagrant](https://www.vagrantup.com/)
2. Install [Git](https://git-scm.com/)
3. You'll need SSH, no link provided as there are many distributions

### Using Digital Ocean (recommended to avoid local machine and bandwidth issues)

Requires [Vagrant](https://www.vagrantup.com/), [Git](https://git-scm.com/) and a [Digital Ocean](https://www.digitalocean.com/) account. This uses a 2GB Digital Ocean Droplet. __At the time of this writing, the cost of this droplet size is $20 a month / $0.030 per hour.__



1. Clone the repository at [https://github.com/gocd-demo/GoCD-workshop-setup](https://github.com/gocd-demo/GoCD-workshop-setup) by typing `git clone https://github.com/gocd-demo/GoCD-workshop-setup` in a terminal.

#### Set Up SSH keys

This will allow Vagrant to provision the new machine, as well as allow you to connect to it more easily.

1. [Click here for SSH key instructions](basic.md)

#### Set Up API Token

This will allow Vagrant to create machines on your behalf.

1. Go to [https://cloud.digitalocean.com/settings/api/tokens](https://cloud.digitalocean.com/settings/api/tokens) and click on Generate New Token
2. Copy the token and save it to a safe place like an encrypted password store. You'll need it later, and Digital Ocean won't show it to you again. __Anyone with this token can create droplets on your Digital Ocean account.__
3. In a terminal, type

  `DIGITAL_OCEAN_KEY=[YOUR_KEY]`

  For example, if your token is '123456789' you'll type DIGITAL_OCEAN_KEY=123456789

  * Note: typing this into the terminal this way will set that value as an environment variable for as long as this terminal is active. It will not work in any other terminals you launch or after you close the one you're using now. If you'd like this key to be persistent you'll need to add an [environment variable](https://en.wikipedia.org/wiki/Environment_variable) to your system.


4. Rename Vagrantfile.digitalocean to Vagrantfile by typing

  `mv Vagrantfile.digitalocean Vagrantfile`

  in your terminal.

5. Type `vagrant up` in your terminal.

6. When complete, use your web browser to go to [https://cloud.digitalocean.com/droplets](https://cloud.digitalocean.com/droplets)

7. Copy the IP address of your new machine.

8. Go to http://[YOUR_IP_ADDRESS]:8153/ in a web browser. For example, http://192.168.0.1:8153/

### Using Virtualbox for local installation

Requires Vagrant and Virtualbox

1. Clone this repository
2. Rename Vagrantfile.virtualbox to Vagrantfile
3. Run 'vagrant up' (this will take a while, it builds most of the box)
4. Go to http://localhost:8153/
