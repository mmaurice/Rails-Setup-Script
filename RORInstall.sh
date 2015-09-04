#!/bin/bash
#This is a script to set up the ruby on rails environment

user=$(whoami)

sudo apt-get upgrade
sudo apt-get install curl

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -L https://get.rvm.io | bash -s stable --ruby

source /home/$user/.rvm/scripts/rvm

sudo apt-get install rubygems1.9.1
rvm install ruby

(rvm --default use ruby-2.2.2) || (	rvm install ruby-2.2.2)

sudo apt-get install nodejs

gem -v

echo "gem: --no-document" >> ~/.gemrc

gem install bundler
gem install nokogiri

rvm use ruby-2.2.2@rails4.2 --create

gem install rails
rails -v


#removes unneeded packages
sudo apt-get autoremove

#Creates a directory for rails development
if [ -d "/home/$user/RailsDev" ]
then
	echo "RailsDev directory already exists!"
else
	echo "RailsDev directory has been created!"
	mkdir "/home/$user/RailsDev"
fi