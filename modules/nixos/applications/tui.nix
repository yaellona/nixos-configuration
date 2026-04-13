{ pkgs, ... }:
{
  flake.modules.nixos.tui = {
    environment.systemPackages = with pkgs; [
      kitty
      opencode
      go-musicfox
      yazi
    ];
  };
}
