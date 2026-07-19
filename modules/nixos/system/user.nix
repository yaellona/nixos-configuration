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
        "render" # 新增
        "video" # 新增
      ];
      useDefaultShell = true;
    };
  };
}
