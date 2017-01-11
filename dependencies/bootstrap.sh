#!/usr/bin/env bash

# Update & Install
apt-get update
apt-get install -y build-essential git curl emacs

export HOME=/home/vagrant


# Installing nvm
echo "INSTALLING NVM..."
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
echo "source $HOME/.nvm/nvm.sh" >> $HOME/.bashrc
source $HOME/.nvm/nvm.sh
echo "DONE INSTALLING NVM"


# Installing Node.JS
echo "INSTALLING NODEJS..."
nvm install 7.4.0
chown -R vagrant:vagrant $HOME/.nvm
echo "DONE INSTALLING NODE"


# Installing NPM packages
echo "INSTALLING NPM PACKAGES..."
npm install -g grunt-cli bower yo generator-karma generator-angular
echo "DONE INSTALLING NPM PACKAGES"


# Installing rbenv
echo "INSTALLING RBENV..."
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
cd $HOME/.rbenv && src/configure && make -C src
echo "export PATH=$HOME/.rbenv/bin:$PATH" >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
chown -R vagrant:vagrant $HOME/.rbenv
echo "DONE INSTALLING RBENV"
exec $SHELL

export HOME=/home/vagrant

# Installing ruby build
echo "INSTALLING RUBY_BUILD..."
git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
echo "export PATH=$HOME/.rbenv/plugins/ruby-build/bin:$PATH" >> $HOME/.bashrc
chown -R vagrant:vagrant $HOME/.rbenv/plugins
echo "DONE INSTALLING RUBY BUILD"
exec $SHELL


# Installing Ruby
echo "INSTALLING RUBY..."
rbenv install 2.3.0
rbenv global 2.3.0
rbenv rehash
echo "DONE INSTALLING RUBY"
