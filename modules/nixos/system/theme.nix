{ pkgs, ... }:
{
  flake.modules.nixos.theme = {
    programs.dconf.enable = true;
    gtk.iconCache.enable = true;

    environment.systemPackages = with pkgs; [
      catppuccin-cursors.mochaMauve
      whitesur-icon-theme
      gnome-themes-extra
      kdePackages.qt6ct
      libsForQt5.qt5ct
      libsForQt5.qtstyleplugins
    ];

    environment.variables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };
}
