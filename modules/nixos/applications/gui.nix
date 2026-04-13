{ pkgs, ... }:
{
  flake.modules.nixos.gui = {
    environment.systemPackages = with pkgs; [
      qq
      wechat
      telegram-desktop
      animeko
      postman
      obs-studio
      vscode-fhs

    ];
    programs.firefox.enable = true;
  };
}
