# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "review"

  config.vm.box = "yungsang/boot2docker"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :docker do |d|
    d.build_image "/vagrant/", args: "-t yungsang/review"
    d.run "review", image: "yungsang/review",
      args: "-v /vagrant/review-projects:/review-projects"
  end
end
