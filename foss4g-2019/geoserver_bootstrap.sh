#!/usr/bin/env bash

#Install as user Vagrant but for some commands we need
# allow root prilegdes to Vagrant user

#Install Java and GeoServer-2.15.1

apt install default-jre -y
apt install openjdk-8-jre-headless
echo "Download and install GeoServer-2.15.1"
#curl -L 'http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.1/geoserver-2.15.1-bin.zip' --output geoserver-2.15.1.zip
wget -N http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.1/geoserver-2.15.1-bin.zip'
unzip geoserver-2.15.1-bin.zip
sudo mv geoserver-2.15.1 /usr/share/geoserver
#rm geoserver-2.15.1.zip
sudo echo "export GEOSERVER_HOME=/usr/share/geoserver" >> ~/.profile
#echo "export GEOSERVER_HOME=/usr/share/geoserver" >> ~/.bashrc

source ~/.profile
#source ~/.bashrc
sudo chown -R vagrant /usr/share/geoserver/
