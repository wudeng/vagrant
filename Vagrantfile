# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    config.vm.define "server" do |server|
        # The most common configuration options are documented and commented below.
        # For a complete reference, please see the online documentation at
        # https://docs.vagrantup.com.
        
        # Every Vagrant development environment requires a box. You can search for
        # boxes at https://vagrantcloud.com/search.
        config.vm.box = "ubuntu/xenial64"
        config.vm.hostname = "server"
        # Disable automatic box update checking. If you disable this, then
        # boxes will only be checked for updates when the user runs
        # `vagrant box outdated`. This is not recommended.
        # config.vm.box_check_update = false
        
        # Create a forwarded port mapping which allows access to a specific port
        # within the machine from a port on the host machine. In the example below,
        # accessing "localhost:8080" will access port 80 on the guest machine.
        # NOTE: This will enable public access to the opened port
        # config.vm.network "forwarded_port", guest: 80, host: 8080
        # config.vm.network "forwarded_port", guest: 20280, host: 20280
        # config.vm.network "forwarded_port", guest: 20288, host: 20288
        # config.vm.network "forwarded_port", guest: 8853, host: 8853, protocol: "udp"
        # config.vm.network "forwarded_port", guest: 8853, host: 8853, protocol: "tcp"
        # config.vm.network "forwarded_port", guest: 8854, host: 8854
        # config.vm.network "forwarded_port", guest: 8855, host: 8855
        # config.vm.network "forwarded_port", guest: 20289, host: 20289
        
        # mongodb
        # config.vm.network "forwarded_port", guest: 27017, host: 27017
        
        # Create a forwarded port mapping which allows access to a specific port
        # within the machine from a port on the host machine and only allow access
        # via 127.0.0.1 to disable public access
        # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
        
        # Create a private network, which allows host-only access to the machine
        # using a specific IP.
        config.vm.network "private_network", ip: "192.168.56.10"
        
        # Create a public network, which generally matched to bridged network.
        # Bridged networks make the machine appear as another physical device on
        # your network.
        # config.vm.network "public_network"
        
        # Share an additional folder to the guest VM. The first argument is
        # the path on the host to the actual folder. The second argument is
        # the path on the guest to mount the folder. And the optional third
        # argument is a set of non-required options.
        config.vm.synced_folder "../work", "/work" #:mount_options => ["dmode=755","fmode=644"] 
        config.vm.synced_folder "../playground", "/playground"
        
        # Provider-specific configuration so you can fine-tune various
        # backing providers for Vagrant. These expose provider-specific options.
        # Example for VirtualBox:
        #
        config.vm.provider "virtualbox" do |vb|
            # Display the VirtualBox GUI when booting the machine
            vb.gui = false
        
            # Customize the amount of memory on the VM:
            vb.memory = "2048"
        
            vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
            vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000]
        end
        
        config.vm.provision "shell", path: "bootstrap.sh"
        
        
        #
        # View the documentation for the provider you are using for more
        # information on available options.
        
        # Enable provisioning with a shell script. Additional provisioners such as
        # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
        # documentation for more information about their specific syntax and use.
        # config.vm.provision "shell", inline: <<-SHELL
        #   apt-get update
        #   apt-get install -y apache2
        # SHELL
    end

    config.vm.define "client", autostart: false do |client|
        config.vm.box = "ubuntu/xenial64"
        config.vm.hostname = "client"
        config.vm.network "private_network", ip: "192.168.56.11"
        config.vm.synced_folder "../work", "/work"
        config.vm.synced_folder "../playground", "/playground"
        config.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.memory = "1024"
            vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
            vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000]
        end
        config.vm.provision "shell", path: "bootstrap.sh"
    end
end
