{ pkgs, ... }:
{
  flake.modules.nixos.v2ray = {
    services.v2raya = {
      enable = true;
      cliPackage = pkgs.v2ray;
    };
  };
}
