#!/usr/bin/env bash

sudo apt-get update

#Install Graphical User Interface Lubuntu Desktop
echo "---Install Lubuntu Desktop---"
sudo apt install --no-install-recommends lubuntu-desktop -y
sudo apt-get install virtualbox-guest-x11 virtualbox-guest-utils virtualbox-guest-dkms -y

#Install Java
echo "Install Java"
sudo apt install default-jre -y
sudo apt install openjdk-8-jre-headless

#install qgis 3.8
echo "---Install QGIS 3.8 with GRASS and SAGA---"
sudo sh -c 'echo "deb https://qgis.org/ubuntugis bionic main" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src https://qgis.org/ubuntugis bionic main" >> /etc/apt/sources.list'
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
wget -O - https://qgis.org/downloads/qgis-2019.gpg.key | gpg --import
gpg --fingerprint 51F523511C7028C3
gpg --export --armor gpg --fingerprint 51F523511C7028C3 | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install qgis python-qgis qgis-plugin-grass saga -y


#add GDAL environment variable to .bashrc
sudo echo 'export GDAL_DATA=/usr/share/gdal/2.4.2' >> /home/vagrant/.bashrc
source .bashrc

#Install PostgreSQL-11 with PosGIS-2.5.2
echo "---Install PostgreSQL-11 with PosGIS-2.5.2---"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt install -y postgresql-11 postgresql-11-postgis-2.5 postgis-2.5-utils postgis-2.5-client postgresql-11-postgis-2.5-scripts postgresql-contrib-11 postgresql-client-11
sudo apt install postgis -y


# creating password for user postgres
echo "---Create password for user postgres---"
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"
sudo systemctl restart postgresql.service


#Install pgAdmin4
echo "---Install pgAdmin4---"
sudo apt install pgadmin4 -y
