#!/bin/bash

echo "Initializing the Ubuntu Juju instalation."

echo "Adding the Juju PPA repository."

sudo add-apt-repository ppa:juju/stable

echo "Updating to grab the latest juju-core package from the PPA."

sudo apt-get update && sudo apt-get install juju-core

echo "Done!"
