{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    kitty
    opencode
    go-musicfox
  ];
}
