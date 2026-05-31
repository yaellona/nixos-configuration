{ me, ... }:

{
  flake.modules.nixos.user = {
    users.users."${me.username}" = {
      isNormalUser = true;
      description = "${me.username}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "kvm"
        "libvirtd"
        "docker"
      ];
      useDefaultShell = true;
    };
  };
}
