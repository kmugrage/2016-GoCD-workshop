#!/bin/bash

	# Set Up rbenv
	git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	cd ~/.rbenv && src/configure && make -C src
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	~/.rbenv/bin/rbenv init

	# Set up ruby-build

	git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	~/.rbenv/bin/rbenv install 2.3.1

	source ~/.bashrc

	~/.rbenv/bin/rbenv global 2.3.1

	# Install Rails


	gem install rails

