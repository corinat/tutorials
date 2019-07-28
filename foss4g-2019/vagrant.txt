More details about how to create a cross platform micro GIS environment with Vagrat can be found in this article:
http://mapwizard.eu/articles/vagrant/index.html

1.Download VirtulBox 2.5.2: - not using the latest version due bugs related with resizing the display/screen.

https://www.virtualbox.org/wiki/Download_Old_Builds_5_2

2.Download Vagrant:
https://www.vagrantup.com/downloads.html

3. Testing the versions of the software we have just installed

a. gdal
gdalinfo --version

b. postgresql
psql -V

c. PostGIS
sudo -u postgres psql
select PostGIS_full_version();

4. check that shared folder with the host and copy/paste from host to guest works

5. If there is time, install geoserver:
https://docs.geoserver.org/stable/en/user/installation/linux.html
5.1. Install Java environment
     sudo apt update
     java -version
     sudo apt install default-jre -y
     sudo apt install openjdk-8-jre-headless
     java -version
     sudo update-alternatives --config java

5.2. download geoserver.zip
     wget https://sourceforge.net/projects/geoserver/files/GeoServer/2.15.2/geoserver-2.15.2-bin.zip
     sudo unzip geoserver-2.15.2-bin.zip
     sudo mv geoserver-2.15.2 /usr/share/geoserver

6. Download data from geospatial portal
http://www.geo-spatial.org/download/romania-seturi-vectoriale

wget http://www.geo-spatial.org/file_download/29525/ro_judete_poligon.zip

7. Ingest data to postgresql database
shp2pgsql -s 3844 ro_judete_poligon ro_judete_poligon | PGPASSWORD=postgres psql -h localhost -d postgres -U postgres

8. Add data to geoserver as postgis datastore

9. Add data to qgis from geoserver

10. Make vagrant package
$ vagrant package - inside the folder where Vagrantfile is

11. Add the new package to vagrant
11.1 $ vagrant box add foss4gbox package.box
11.2 $ vagrant box list
11.3 Next copy files to create a new Vagrant machine
     sudo cp -r foss4g2/.vagrant/ foss4g2/Vagrantfile foss4g2/ubuntu-bionic-18.04-cloudimg-console.log  foss4g2/bootstrap.sh   ~/Vagrant/test/

     Open Vagrantfile and replace the line config.vm.box = "ubuntu/bionic64" with config.vm.box = "foss4gbox"
     and add the following line:

     config.ssh.insert_key = false

     Vagrant.configure("2") do |config| section

     Next we modify the bootstrap.sh file. Because our new box will install almost everything we have in this file, we will only keep the line that configures the virtualbox guest additions.

     #!/usr/bin/env bash

     sudo apt-get install virtualbox-guest-x11 virtualbox-guest-utils virtualbox-guest-dkms -y
