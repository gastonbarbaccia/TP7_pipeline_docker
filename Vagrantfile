# -*- mode: ruby -*-
# vi: set ft-ruby :

Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/bionic64"
#    master.vm.network "forwarded_port", guest: 8080, host: 8080
#    master.vm.network "forwarded_port", guest: 80, host: 80
#    master.vm.network "forwarded_port", guest: 443, host: 443
    master.vm.network "public_network"

    master.vm.provider "virtualbox" do |v|
      v.name = "master"
      v.memory = "4096"
      v.cpus = 2
     end
    master.vm.provision "shell" do |s|
      s.path = 'jenkins.sh'
    end
  end
end