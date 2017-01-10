#!/usr/bin/env bash

# Update & Install
apt-get update
apt-get install -y build-essential git curl

# Reading Environment Varaibles
#echo "Reading environment variables..."
# Check if env/ directory exists
#if [ -d /vagrant/env/ ]; then
  #for path in /vagrant/env/*; do
    #name=${path##*/}
    # Do not include dotfiles or empty directory (*)
    #if [[ "$name" != "*" ]] && [[ ${name:0:1} != "." ]]; then
      #echo "$name=$(cat $path)"
      #echo "export $name=$(cat $path)" >> /home/vagrant/.bashrc
    #fi
  #done
#fi

# Setting Environment Varaibles
echo "Setting environment variables..."
echo "export NODE_ENV=development" >> /home/vagrant/.bashrc
#echo "\ncd /vagrant" >> /home/vagrant/.bashrc

export HOME=/home/vagrant

# Installing nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
#echo "source ~/.nvm/nvm.sh" >> /home/vagrant/.bashrc
#source /home/vagrant/.nvm/nvm.sh

# Installing Node.JS
echo "Installing Node.JS..."
nvm install 7.4.0
chown -R vagrant:vagrant /home/vagrant/.nvm
export HOME=/home/vagrant


# Installing rbenv

git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
cd /home/vagrant/.rbenv && src/configure && make -C src

PATH="$PATH:$HOME/.rbenv/bin"
echo "export $PATH" >> $HOME/.bashrc


# echo "PATH=$PATH:/vagrant/node_modules/.bin" >> /home/vagrant/.bashrc


# Installing NPM packages
# echo "Installing NPM packages..."
# npm install -g grunt-cli bower yo generator-karma generator-angular
