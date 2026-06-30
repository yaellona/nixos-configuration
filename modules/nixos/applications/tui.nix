{ pkgs, ... }:
{
  flake.modules.nixos.tui = {
    environment.systemPackages = with pkgs; [
      kitty
      go-musicfox
      # v2ray
    ];
  };
}
