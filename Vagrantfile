Vagrant.configure("2") do |config|
  config.vm.box = "base"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "install-dependencies.sh"
  config.vm.network :private_network, ip: "192.168.1.100"
end