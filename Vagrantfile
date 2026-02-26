Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
  end

  # =====================================================
  # DOMAIN CONTROLLER
  # =====================================================
  config.vm.define "dc01" do |dc|
    dc.vm.box = "generic/windows2022"
    dc.vm.hostname = "DC01"

    dc.vm.network "private_network", ip: "192.168.77.10"

    dc.vm.provider "virtualbox" do |vb|
      vb.name = "LAB-DC01"
      vb.memory = 4096
      vb.cpus = 2
    end

    dc.vm.provision "shell",
      privileged: true,
      powershell_elevated_interactive: true,
      path: "scripts/dc01.ps1"
  end

  # =====================================================
  # CLIENT MACHINE
  # =====================================================
  config.vm.define "client01" do |cl|
    cl.vm.box = "generic/windows10"
    cl.vm.hostname = "CLIENT01"

    cl.vm.network "private_network", ip: "192.168.77.20"

    cl.vm.provider "virtualbox" do |vb|
      vb.name = "LAB-CLIENT01"
      vb.memory = 3072
      vb.cpus = 2
    end

    cl.vm.provision "shell",
      privileged: true,
      powershell_elevated_interactive: true,
      path: "scripts/client.ps1"
  end

end