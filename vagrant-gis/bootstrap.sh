#!/usr/bin/env bash

sudo apt-get update

#Install Graphical User Interface Lubuntu Desktop
sudo apt install --no-install-recommends lubuntu-desktop -y
sudo apt install virtualbox-guest-x11 -y

#Install QGIS 2.18
sudo sh -c 'echo "deb http://qgis.org/debian xenial main" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://qgis.org/debian xenial main " >> /etc/apt/sources.list'
wget -O - http://qgis.org/downloads/qgis-2017.gpg.key | gpg --import
gpg --fingerprint CAEB3DC3BDF7FB45
gpg --export --armor CAEB3DC3BDF7FB45 | sudo apt-key add -
sudo apt-get update && sudo apt-get install qgis python-qgis -y

#uninstall GDAL 1.11
cd /usr/share/gdal
sudo rm -rf 1.11
cd

#install GDAL 2.2.2
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
sudo apt update  
sudo apt-get install gdal-bin 
sudo apt install python-gdal -y
sudo apt install python3-gdal -y
sudo su

#add GDAL environment variable to .bashrc
sudo echo 'export GDAL_DATA=/usr/share/gdal/2.2' >> /home/vagrant/.bashrc
source .bashrc

#Install PostgreSQL 10
echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' >> /etc/apt/sources.list.d/pgdg.list -y
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-10 -y

#Install PostGIS extension
sudo apt install postgis -y

#add postgis and postgis topology extention to postgres database
sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;" postgres


#Install pgAdmin4
sudo apt install pgadmin4 -y