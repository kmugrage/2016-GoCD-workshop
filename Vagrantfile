# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.network "forwarded_port", guest: 80, host: 8888
  config.vm.network "forwarded_port", guest: 8153, host: 8153

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "4"
    vb.memory = "8192"
  end

  config.vm.provision "shell", inline: <<-SHELL

    # Add GoCD official
    echo "deb https://download.go.cd /" | sudo tee /etc/apt/sources.list.d/gocd.list
    curl https://download.go.cd/GOCD-GPG-KEY.asc | sudo apt-key add -
    sudo apt-get update

    # Will be needed by Ruby
    sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev git
    sudo apt-get install -y ruby rails rake


    # Install and set up GoCD server and agents
    sudo apt-get install -y openjdk-7-jdk
    sudo apt-get install -y go-server go-agent

    # Stop GoCD
    sudo /etc/init.d/go-server stop

    # Get our GoCD YAML repository
    # sudo -i -u go git clone https://github.com/kmugrage/yaml-gocd-test.git

    Add more GoCD agents
    if [ ! -f /etc/init.d/go-agent-2 ]; then
      echo "Installing agent 2"
      cp /etc/init.d/go-agent /etc/init.d/go-agent-2
      sed -i 's/# Provides: go-agent$/# Provides: go-agent-2/g' /etc/init.d/go-agent-2
      ln -s /usr/share/go-agent /usr/share/go-agent-2
      cp -p /etc/default/go-agent /etc/default/go-agent-2
      mkdir /var/{lib,log}/go-agent-2
      chown go:go /var/{lib,log}/go-agent-2

      update-rc.d go-agent-2 defaults
    fi

    if [ ! -f /etc/init.d/go-agent-3 ]; then
      echo "Installing agent 3"
      cp /etc/init.d/go-agent /etc/init.d/go-agent-3
      sed -i 's/# Provides: go-agent$/# Provides: go-agent-3/g' /etc/init.d/go-agent-3
      ln -s /usr/share/go-agent /usr/share/go-agent-3
      cp -p /etc/default/go-agent /etc/default/go-agent-3
      mkdir /var/{lib,log}/go-agent-3
      chown go:go /var/{lib,log}/go-agent-3

      update-rc.d go-agent-3 defaults
    fi

    # install the yaml config plugin
    cp /vagrant/yaml-config-plugin-0.1.0.jar /var/lib/go-server/plugins/external/
    chown go:go /var/lib/go-server/plugins/external/yaml-config-plugin-0.1.0.jar

    # Lower the polling interval - WAY too low for a real server, don't do this!
    /bin/bash /vagrant/update_go-server.sh

    # Replace the default config file with ours
    /bin/bash /vagrant/update_config.sh

    # Start the server
    sudo -u go /etc/init.d/go-server start

    sudo -u go /etc/init.d/go-agent start
    sudo -u go /etc/init.d/go-agent-2 start
    sudo -u go /etc/init.d/go-agent-3 start

    # Remove packages no longer needed
    sudo apt-get -y autoremove

  SHELL

end
