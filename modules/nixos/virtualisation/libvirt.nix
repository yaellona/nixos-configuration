{ pkgs, ... }:
{
  flake.modules.nixos.libvirt = {
    programs.virt-manager.enable = true;

    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        runAsRoot = true;
        swtpm.enable = true;
        vhostUserPackages = with pkgs; [
          virtiofsd
        ];
      };
    };

    boot.extraModprobeConfig = "options kvm-intel nested=1";
    virtualisation.spiceUSBRedirection.enable = true;
    hardware.graphics.enable = true;
    services.qemuGuest.enable = true;
    services.spice-webdavd.enable = true;
    # environment.systemPackages = [ pkgs.virtio-win ];
  };
}
