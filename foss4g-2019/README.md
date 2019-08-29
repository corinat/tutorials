## Installation steps

**1.Download and install VirtulBox and the extension pack** 
https://www.virtualbox.org/wiki/Downloads

**2.Download Vagrant:**
https://www.vagrantup.com/downloads.html

**3.Install vagrant plugins:**
- to automatically configure the VM

`vagrant plugin install vagrant-vbguest`


- to be able to increase the disk size of our virtual machine, which by default has 10GB

`vagrant plugin install vagrant-disksize`


*3.1 check if the plugins have been successfully installed:*

`vagrant plugin list`

**4. Create a folder for the vagrant machine and name it foss4g-2019**

command line:

Windows: `mkdir foss4g-2019`

Linux: `sudo mkdir foss4g-2019`

cd into that folder:

Windows: `cd foss4g-2019`

Linux: `cd foss4g-2019`

**5. Download the configuration files into the newly created foss4g folder or use git to download/clone the files.**

**6. Run `vagrant up` inside foss4g-2019 folder**
  
username: `vagrant`

password: `vagrant`

**7. Testing the versions of the software we have just installed**

a. gdal

`gdalinfo --version`

b. postgresql

`psql -V`

c. PostGIS


`sudo -u postgres psql`

`select PostGIS_full_version();`

**8. Check that shared folder and copy/paste from host to guest works**

**9. If there is time let's add some data into postgresql and from there to geoserver and from geoserver to qgis**

*9.1. Download world boundaries data from thematicmapping.org. - http://thematicmapping.org/downloads/world_borders.php*

`wget http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip`

`unzip TM_WORLD_BORDERS_SIMPL-0.3.zip`

*9.2. Ingest data to postgresql database*

`shp2pgsql -s 4326 TM_WORLD_BORDERS_SIMPL-0.3.shp world-borders | PGPASSWORD=postgres psql -h localhost -d postgres -U postgress`

*9.3. Add data to geoserver as postgis datastore*

*9.4. Add data to qgis from geoserver*

**10. Create vagrant box**

run `vagrant package` - inside the foss4g-2019 folder where Vagrantfile is

**11. Add the new package to vagrant**

*11.1 `vagrant box add foss4gbox package.box`*

*11.2 `vagrant box list`*

*11.3 Next copy these files to create a new Vagrant machine*

`sudo cp -r foss4g2/.vagrant/ foss4g2/Vagrantfile foss4g2/ubuntu-bionic-18.04-cloudimg-console.log  foss4g2/bootstrap.sh   ~/Vagrant/test/`

     Open Vagrantfile and:
     
- replace the line `config.vm.box = "ubuntu/bionic64"` with `config.vm.box = "foss4gbox"`

- add the following line (sometimes there are issues with the ssh key):
 
     `config.ssh.insert_key = false`
    
- remove or comment oout the line:
     
     `config.vm.provision "shell", path: "geoserver_bootstrap.sh", privileged: false`
     
- run: `vagrant up`

     Next we modify the bootstrap.sh file. Because our new box will install almost everything we have in this file, we will only keep the line that configures the virtualbox guest additions.

     `#!/usr/bin/env bash`

     `sudo apt-get install virtualbox-guest-x11 virtualbox-guest-utils virtualbox-guest-dkms -y`



**Details about how to use a box from macOS to Windows or vice verse can be found here http://mapwizard.eu/articles/vagrant/index.html**
