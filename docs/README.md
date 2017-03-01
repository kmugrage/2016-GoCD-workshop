# 2016-GoCD-workshop

Use this to create and run a GoCD server to be used for the GoCD Workshop.

## Using Digital Ocean (recommended to avoid local machine issues and bandwidth issues)

Requires Vagrant and a Digital Ocean account. This uses a 2GB Digital Ocean Droplet. At the time of this writing, the cost of this droplet size is $20 a month / $0.030 per hour.

1. Clone this repository

### Set Up SSH keys

1. If you don't have an SSH key on your system, create one.
2. Go to https://cloud.digitalocean.com/settings/security and click Add SSH key
3. Copy and paste the public key, name it 'GoCD Workshop' (case sensitive)

### Set Up API Token

1. Go to https://cloud.digitalocean.com/settings/api/tokens and click on Generate New Token
2. We don't want to store your new token in a file that could accidentally get added to Git, so create an environment variable on your system called DIGITAL_OCEAN_KEY with the token. For example, if your token is '123456789' you'll set DIGITAL_OCEAN_KEY='123456789'
  * [Mac Instructions](http://osxdaily.com/2015/07/28/set-enviornment-variables-mac-os-x/)
  * [Ubuntu Instructions](https://help.ubuntu.com/community/EnvironmentVariables) )
  * (Note: if someone has a good tutorial for setting in Windows please let me know.
3. Rename Vagrantfile.digitalocean to Vagrantfile
4. Run 'vagrant up'
5. When complete, use your web browser to go to https://cloud.digitalocean.com/droplets
6. Copy the IP address of your new machine.
7. Go to http://[YOUR_IP_ADDRESS]:8153/ in a web browser. For example, http://192.168.0.1:8153/

## Using Virtualbox for local installation

Requires Vagrant and Virtualbox

1. Clone this repository
2. Rename Vagrantfile.virtualbox to Vagrantfile
3. Run 'vagrant up' (this will take a while, it builds most of the box)

The GoCD instance will be set to poll https://github.com/gocd-demo/2016-GoCD-workshop-application for pipeline changes.
