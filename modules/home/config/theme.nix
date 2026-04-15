{ pkgs, me, ... }:

{
  flake.modules.hjem.theme = {
    xdg.config.files = {
      "gtk-3.0/settings.ini".text = ''
        [Settings]
        gtk-theme-name=Adwaita-Dark
        gtk-icon-theme-name=WhiteSur-dark
        gtk-cursor-theme-name=catppuccin-mocha-mauve-cursors
        gtk-application-prefer-dark-theme=1
      '';
      "gtk-4.0/settings.ini".text = ''
        [Settings]
        gtk-theme-name=Adwaita-Dark
        gtk-icon-theme-name=WhiteSur-dark
        gtk-cursor-theme-name=catppuccin-mocha-mauve-cursors
        gtk-application-prefer-dark-theme=1
      '';
      "qt5ct/qt5ct.conf".text = ''
        [Appearance]
        style=gtk2
        icon_theme=WhiteSur-dark
      '';
      "qt6ct/qt6ct.conf".text = ''
        [Appearance]
        style=gtk2
        icon_theme=WhiteSur-dark
      '';
    };
  };
}
