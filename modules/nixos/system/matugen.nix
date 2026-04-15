{ pkgs, ... }:
{
  flake.modules.nixos.matugen = {
    environment.systemPackages = [
      pkgs.matugen
      pkgs.jq
      pkgs.imagemagick
      pkgs.awww
    ];
  };
}
