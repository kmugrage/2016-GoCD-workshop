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
    sudo apt-get install -y openjdk-7-jre
    sudo apt-get install -y go-server go-agent

    # Stop GoCD
    sudo /etc/init.d/go-server stop

    # Add more GoCD agents
    if [ ! -f /etc/init.d/go-agent-2 ]; then
      echo "Installing agent 2"
      ln -s /etc/init.d/go-agent /etc/init.d/go-agent-2
      ln -s /usr/share/go-agent /usr/share/go-agent-2
      cp /etc/default/go-agent /etc/default/go-agent-2
      mkdir /var/{lib,log}/go-agent-2
      chown go:go /var/{lib,log}/go-agent-2

      ln -s /etc/init.d/go-agent-2 /etc/rc2.d/S99go-agent-2
    fi

    if [ ! -f /etc/init.d/go-agent-3 ]; then
      echo "Installing agent 3"
      ln -s /etc/init.d/go-agent /etc/init.d/go-agent-3
      ln -s /usr/share/go-agent /usr/share/go-agent-3
      cp /etc/default/go-agent /etc/default/go-agent-3
      mkdir /var/{lib,log}/go-agent-3
      chown go:go /var/{lib,log}/go-agent-3

      ln -s /etc/init.d/go-agent-3 /etc/rc2.d/S99go-agent-3
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
