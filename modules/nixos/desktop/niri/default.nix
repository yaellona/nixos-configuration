{ pkgs, ... }:
{
  flake.modules.nixos.niri = {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };

    services.displayManager.ly = {
      enable = true;
    };
  };
}
