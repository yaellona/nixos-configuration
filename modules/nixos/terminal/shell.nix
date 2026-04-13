{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  programs.bash.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.systemPackages = with pkgs; [
    kitty
  ];
}
