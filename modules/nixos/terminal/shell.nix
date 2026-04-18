{
  pkgs,
  ...
}:
{
  flake.modules.nixos.shell = {
    programs.fish.enable = true;
    programs.bash.enable = true;
    users.defaultUserShell = pkgs.fish;
  };
}
