#! /usr/bin/env bash

# The Basics
apt-get update
apt-get install -y build-essential
apt-get install -y git

# Text Editor
apt-get install -y vim
apt-get install -y tmux
apt-get install -y silversearcher-ag

# Postgres
apt-get install -y libpq-dev
apt-get install -y postgresql
apt-get install -y postgresql-contrib
sudo -u postgres createuser --superuser vagrant

# Redis
apt-get install -y redis-server

# PhantonJS
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
rm phantomjs-2.1.1-linux-x86_64.tar.bz2
mv phantomjs-2.1.1-linux-x86_64/ /usr/local/share/
ln /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/

# NodeJS (for uglifying and coffeescript support)
apt-get install -y nodejs

# Ruby & Bundler
# ruby-install: https://github.com/postmodern/ruby-install#readme
wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
tar -xzvf ruby-install-0.5.0.tar.gz
cd ruby-install-0.5.0 && make install
cd .. && rm -rf ruby-install-0.5.0
ruby-install --system `grep -m1 '^ruby "[0-9.]*"' /vagrant/Gemfile | sed 's/"//g'`
gem install bundler

# Heroku Toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Initialize App
cd /vagrant
sudo -u vagrant bundle install
sudo -u vagrant rake db:setup
