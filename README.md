# 2016-GoCD-workshop

Use this to create and run a Virtualbox to be used for the GoCD Workshop.

## Using Digital Ocean

Requires Vagrant and a Digital Ocean account

1. Clone this repository
2. Go to https://cloud.digitalocean.com/settings/api/tokens and click on Generate New Token
3. We don't want to store your new token in a file that could accidentally get added to Git, so create an environment variable on your system called DIGITAL_OCEAN_KEY ( (Mac)[http://osxdaily.com/2015/07/28/set-enviornment-variables-mac-os-x/] )

## Using Virtualbox for local installation

Requires Vagrant and Virtualbox

1. Clone this repository
2. Rename Vagrantfile.virtaulbox to Vagrantfile
3. Run 'vagrant up' (this will take a while, it builds most of the box)

The GoCD instance will be set to poll https://github.com/gocd-demo/2016-GoCD-workshop-application for pipeline changes.
