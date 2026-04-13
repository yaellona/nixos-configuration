{ me, ... }:

{
  users.users."${me.username}" = {
    isNormalUser = true;
    description = "kaelwen";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    useDefaultShell = true;

  };
}
