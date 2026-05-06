{ pkgs, ... }:
{
  flake.modules.nixos.gui = {
    environment.systemPackages = with pkgs; [
      qq
      wechat
      telegram-desktop
      animeko
      # onlyoffice-desktopeditors
      wpsoffice-cn
      gthumb
      evince
      mpv
    ];
  };
}
