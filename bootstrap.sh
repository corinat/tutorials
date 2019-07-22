#!/usr/bin/env bash

sudo apt-get update

#Install Graphical User Interface Lubuntu Desktop
echo "Install Lubuntu Desktop"
sudo apt install --no-install-recommends lubuntu-desktop -y
#sudo apt install virtualbox-guest-x11 -y
sudo apt-get install virtualbox-guest-x11 virtualbox-guest-utils virtualbox-guest-dkms -y
sudo apt-get install xauth


#install qgis3
#echo "Install QGIS 3.8 with GRASS and SAGA"
#sudo sh -c 'echo "deb https://qgis.org/ubuntugis bionic main" >> /etc/apt/sources.list'
#sudo sh -c 'echo "deb-src https://qgis.org/ubuntugis bionic main" >> /etc/apt/sources.list'
#sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
#wget -O - https://qgis.org/downloads/qgis-2017.gpg.key | gpg --import
#gpg --fingerprint CAEB3DC3BDF7FB45
#gpg --export --armor CAEB3DC3BDF7FB45 | sudo apt-key add -
#sudo apt-get update -y
#sudo apt-get install qgis python-qgis qgis-plugin-grass saga -y


#Install Java and GeoServer-2.15.1
echo "Install Java"
sudo apt install default-jre -y
sudo apt install openjdk-8-jre-headless
echo "Download and install GeoServer-2.15.1"
#curl -L 'http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.1/geoserver-2.15.1-bin.zip' --output geoserver-2.15.1.zip
#wget --content-disposition -c "http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.1/geoserver-2.15.1-bin.zip" -progress=bar:force
#wget http://sourceforge.net/projects/geoserver/files/GeoServer/2.15.1/geoserver-2.15.1-bin.zip
#sudo unzip geoserver-2.15.1-bin.zip
#sudo mv geoserver-2.15.1 geoserver
#sudo mv geoserver /usr/share/
sudo echo "export GEOSERVER_HOME=/usr/share/geoserver" >> ~/.profile
sudo . ~/.profile
sudo chown -R vagrant /usr/share/geoserver/


#Install PostgreSQL-11 with PosGIS-2.5.2
#echo "Install PostgreSQL-11 with PosGIS-2.5.2"
#sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
#sudo wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
#sudo apt update
#sudo apt install -y postgresql-11 postgresql-11-postgis-2.5 postgis-2.5-utils postgis-2.5-client postgresql-11-postgis-2.5-scripts postgresql-contrib-11 postgresql-client-11
#sudo apt install postgis -y


#add postgis and postgis topology extention to postgres database
#echo "add postgis and postgis topology"
#sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;" postgres


# creating password for user postgres
#echo "Create password for user postgres"
#sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"
#sudo systemctl restart postgresql.service


#Install pgAdmin4
#echo "Install pgAdmin4"
#sudo apt install pgadmin4 -y


