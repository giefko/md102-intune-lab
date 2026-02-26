Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
  end

  # ---------- DC01: Windows Server 2022 (AD DS) ----------
  config.vm.define "dc01" do |dc|
    dc.vm.box = "gusztavvargadr/windows-server-2022"
    dc.vm.hostname = "DC01"
    dc.vm.network "private_network", ip: "192.168.56.10"

    dc.vm.provider "virtualbox" do |vb|
      vb.name = "MD102-DC01"
      vb.memory = 4096
      vb.cpus = 2
    end

    dc.vm.provision "shell",
      privileged: true,
      powershell_elevated_interactive: true,
      path: "scripts/dc01.ps1"
  end

  # ---------- CLIENT: Windows 10 ----------
  config.vm.define "client" do |cl|
    cl.vm.box = "gusztavvargadr/windows-10"
    cl.vm.hostname = "WIN-CLIENT"
    cl.vm.network "private_network", ip: "192.168.56.20"

    cl.vm.provider "virtualbox" do |vb|
      vb.name = "MD102-CLIENT"
      vb.memory = 4096
      vb.cpus = 2
    end

    cl.vm.provision "shell",
      privileged: true,
      powershell_elevated_interactive: true,
      path: "scripts/client.ps1"
  end
end