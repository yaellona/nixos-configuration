{ pkgs, ... }:
{
  flake.modules.homeManager.btop = {
    programs.btop = {
      enable = true;
      package = pkgs.btop-rocm;
    };
  };
}
