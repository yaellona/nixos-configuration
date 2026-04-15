{ lib, ... }:
{
  flake.modules.nixos.sudo = {
    security.sudo-rs = {
      enable = true;
      wheelNeedsPassword = lib.mkForce true;
    };
  };
}
