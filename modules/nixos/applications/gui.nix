{ pkgs, ... }:
{
  flake.modules.nixos.gui = {
    environment.systemPackages = with pkgs; [
      # qq
      #wechat
      telegram-desktop
      animeko
      kdePackages.kdenlive
      # onlyoffice-desktopeditors
      #wpsoffice-cn
      gthumb
      evince
      mpv
    ];
  };
}
