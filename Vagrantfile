Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider :virtualbox do |v|
    # Enables symlinks
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  ## This is what configuration will be copied to the Vagrant
  config.vm.synced_folder "srv/", "/srv/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "srv/minion"
    salt.run_highstate = true
    salt.install_type = "stable"
  end
end
