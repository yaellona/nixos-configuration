{ pkgs, ... }:
{
  flake.modules.nixos.niri = {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };

    services.displayManager.gdm = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      fuzzel
      waybar
      swaylock
      swayosd
      mako
      waypaper
      awww
      xwayland-satellite
      thunar

    ];
  };
}
