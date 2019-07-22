# -*- mode: ruby -*-

# vi: set ft=ruby :

#We will add the 16.04 version of ubuntu

#And change the disk space from 10 GB to 30 GB

Vagrant.configure("2") do |config|

#config.vm.box = "ubuntu/xenial64"
config.vm.box = "ubuntu/bionic64"
config.disksize.size = "20GB"
config.ssh.forward_x11 = true
#We will share the Downloads folder from the Windows host machine with Ubuntu guest OS #from our virtual machine

#Make sure to change this path with the one coresponding to your computer !!!!!!!!!!!!!!!!!!   

#This will help us share the Downloads folder from the Windows machine with the virtual     #machine. But on the guest machine the Downloads folder will be found as vagrant_data

#for Windows OS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Comment next line if you are using macOS or Ubuntu!!!!!!!!!!

config.vm.synced_folder "/Users/corina/Downloads", "/vagrant_data"
#config.vm.synced_folder "/Volumes/Data", "/HDD_data"
config.vm.network "private_network", ip: "192.168.33.10"
config.vm.network "forwarded_port", guest: 80, host: 8011, host_ip: "127.0.0.1"
config.vm.network "forwarded_port", guest: 8888, host: 8889, host_ip: "127.0.0.1"
#config.vbguest.iso_path = "https://download.virtualbox.org/virtualbox/5.2.18/"

if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false  
end

#For macOS and Ubuntu!!!!!!!!!!!!!!!!!!!!! Uncomment next line if you are using macOS or Ubuntu!!!!!!!!!

#config.vm.synced_folder "/Users/your_user_name/Downloads", "/vagrant_data"

#This is where we pass the bootstrap.sh file so that Vagrant can run install all we need in the #machine.

config.vm.provision :shell, path: "bootstrap.sh"

config.vm.provision "shell", inline: <<-SHELL
  #echo "export MYVAR='my_value'" >> /etc/profile.d/myvar.sh
  #echo export GEOSERVER_HOME=/usr/share/geoserver >> ~/.profile
  . ~/.profile
SHELL
config.vm.provision "shell", inline: <<-SHELL
  echo 'export GEOSERVER_HOME=/usr/share/geoserver' >> ~/.profile
  . ~/.profile
SHELL


config.vm.provision "shell", inline: "echo \ export GEOSERVER_HOME=/usr/share/geoserver >> ~/.profile", run: "always"
config.vm.provision "shell", inline: ". ~/.profile", run: "always"
# Add the VirtualBox machine:

config.vm.provider "virtualbox" do |vb|

# Display the VirtualBox GUI when booting the machine

vb.gui = true

# Customize the amount of memory on the VM:

vb.memory = "4096"

# set cpu’s  

vb.cpus = 3

#Enable biderectional “copy/paste” and “drag and drop”

vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']    

vb.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']

#config.trigger.after :up do |trigger|
#    trigger.name = "Hello world"
#    trigger.info = "I am running after vagrant up!!"
#    trigger.run_remote = {inline: fig.vm.provision :shell, path: "test.sh", run: 'always'}
#end

end

end

