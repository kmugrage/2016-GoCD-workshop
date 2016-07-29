#!/bin/bash
set -e
set -x

# Put our config file in place
OLD_ID=$(sed -n 's/.*serverId="\([^"]*\)".*/\1/p' /etc/go/cruise-config.xml)
sed -e 's/serverId="[^"]*"/serverId="'$OLD_ID'"/' /vagrant/new_config.xml >new-id-old-config.xml
mv new-id-old-config.xml /etc/go/cruise-config.xml
chown go:go /etc/go/cruise-config.xml
