#!/bin/bash

	# Set Up rbenv

	if [ ! -d ~/.rbenv ]; then
		git clone https://github.com/rbenv/rbenv.git ~/.rbenv
		cd ~/.rbenv && src/configure && make -C src
		echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
		echo 'eval "$(rbenv init -)"' >> ~/.bashrc
		~/.rbenv/bin/rbenv init
	fi

	source ~/.bashrc

	# Set up ruby-build

	if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
		git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	fi

	if [ ! -d ~/.rbenv/versions/2.3.1 ]; then
		~/.rbenv/bin/rbenv install 2.3.1
	fi

	~/.rbenv/bin/rbenv global 2.3.1

	# Install Rails


	gem install rails

