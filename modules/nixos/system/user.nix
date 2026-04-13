{ me, ... }:

{
  flake.modules.nixos.user = {
    users.users."${me.username}" = {
      isNormalUser = true;
      description = "kaelwen";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      useDefaultShell = true;

    };
  };
}
