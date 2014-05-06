#!/bin/bash

echo "Initializing the Rails instalation."

echo "Preparing the environment..."

echo "Updating packages."

sudo apt-get update

echo "Installing Ruby dependencies."

sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev

echo "Installing rbenv."

install_rbenv_full

echo "Installing Ruby 2.1.0."

install_ruby

echo "Setting Rubygems not to install the documentation for each package locally."

echo "gem: --no-ri --no-rdoc" > ~/.gemrc

echo "Installing Rails itself."

install_nodejs
install_rails

echo "Done!"


# Functions
# =========

install_ruby() {
  rbenv install 2.1.0
  rbenv global 2.1.0
  ruby -v
}

install_rbenv_full() {
  install_rbenv
  install_ruby_build
}

install_rbenv() {
  cd
  git clone git://github.com/sstephenson/rbenv.git .rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  exec $SHELL
}

install_ruby_build() {
  cd
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
  exec $SHELL
 }

install_nodejs() {
  sudo add-apt-repository ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install nodejs
}

install_rails() {
  gem install rails
  rbenv rehash
  rails -v
}
