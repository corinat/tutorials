#!/usr/bin/env bash

#Install GeoServer-2.15.1
echo "Download and install GeoServer-2.15.1"
wget -N http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.1/geoserver-2.15.1-bin.zip'
unzip geoserver-2.15.1-bin.zip
sudo mv geoserver-2.15.1 /usr/share/geoserver
sudo echo "export GEOSERVER_HOME=/usr/share/geoserver" >> ~/.profile
source ~/.profile
sudo chown -R vagrant /usr/share/geoserver/
