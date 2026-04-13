{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qq
    wechat
    telegram-desktop
    animeko
    postman

  ];
}
