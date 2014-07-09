Vagrant.configure("2") do |config|
  config.vm.box = "centos65-x86_64-20140116"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.provider :virtualbox do |v|
    # Enables symlinks
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  ## This is what configuration will be copied to the Vagrant
  config.vm.synced_folder "srv/", "/srv/"
  config.vm.synced_folder "dev/", "/git/"

  config.vm.provision :salt do |salt|
    salt.minion_config = "srv/minion"
    salt.run_highstate = true
    salt.install_type = "stable"
  end
end
