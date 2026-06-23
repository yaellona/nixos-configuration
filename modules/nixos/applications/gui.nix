{ pkgs, ... }:
{
  flake.modules.nixos.gui = {
    environment.systemPackages = with pkgs; [
      #  (qq.override {
      #   commandLineArgs = "--ozone-platform-hint=auto --enable-wayland-ime --wayland-text-input-version=3";
      # })
      #wechat
      telegram-desktop
      # animeko
      kdePackages.kdenlive
      # onlyoffice-desktopeditors
      libreoffice
      # wpsoffice-cn
      gthumb
      evince
      mpv
      localsend
    ];
  };
}
