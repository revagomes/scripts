#!/bin/bash

echo "Initializing the Loomio instalation."

echo "Installing Image Magick."

sudo apt-get install libmagickwand-dev graphicsmagick-libmagick-dev-compat

echo "Installing Ruby Version Manager."


if ! curl_loc="$(type -p "curl")" || [ -z "$curl_loc" ]; then
  install_rvm_curl
else
  install_rvm_curl --full
fi

echo "Configuring RVM."

rvm get stable

rvm requirements

echo "Installing libyaml-dev."

sudo apt-get install libyaml-dev

echo "Installing Ruby 2.0.0."

  rvm install 2.0.0 --with-openssl-dir=$HOME/.rvm/usr

# echo "Setting RVM to use Ruby 2.0.0 with a custom gemset."

# rvm use 2.0.0@railstutorial_rails_4_0 --create --default

# echo "Installing Ruby gems."

# if ! gem_loc="$(type -p "gem")" || [ -z "$gem_loc" ]; then
#   install_rubygems
# else
#   install_rubygems
# fi

# echo "Installing Rails 4."

# gem install rails --version 4.0.3

source "./install-rails.sh"

echo "Done!"

# Functions
# =========

install_rvm_curl() {

  if [ -z "$1" ]; then
    sudo apt-get install curl
  fi
  curl -sSL https://get.rvm.io | bash -s stable
}

install_rubygems() {
  sudo apt-get install rubygems
  export PATH=/var/lib/gems/1.8/bin:$PATH
}
