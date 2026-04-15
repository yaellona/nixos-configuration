{ pkgs, ... }:
{
  flake.modules.nixos.gui = {
    environment.systemPackages = with pkgs; [
      qq
      wechat
      telegram-desktop
      animeko
      postman
      vscode-fhs
      onlyoffice-desktopeditors
      gthumb
      mpv
    ];
    programs.firefox.enable = true;
  };
}
