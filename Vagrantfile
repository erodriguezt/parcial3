Vagrant.configure("2") do |config|

 #config.vbguest.installer_options = { allow_kernel_upgrade: true }


 config.vm.define :firewall do |firewall|
 firewall.vm.box = "generic/centos8" 
 firewall.vm.provision "shell", path: "provisionfirewall.sh"
 firewall.vm.network :public_network, ip: "172.20.10.50"
 firewall.vm.network :private_network, ip: "192.168.100.3"
 firewall.vm.hostname = "firewall"
 end

 config.vm.define :servidor do |servidor|
 servidor.vm.provision "shell", path: "provisionstreama.sh"
 servidor.vm.box = "bento/ubuntu-20.04"
 servidor.vm.network :private_network, ip: "192.168.100.4"
 servidor.vm.hostname = "servidor"
 end

 
 end
