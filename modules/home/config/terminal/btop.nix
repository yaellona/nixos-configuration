{ pkgs, ... }:
{
  flake.homeManagerModules.btop = {
    programs.btop = {
      enable = true;
      package = pkgs.btop-rocm;
    };
  };
}
