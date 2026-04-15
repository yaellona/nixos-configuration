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
          virtio-win
          virglrenderer
        ];
      };
    };

    boot.extraModprobeConfig = "options kvm-intel nested=1";
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
