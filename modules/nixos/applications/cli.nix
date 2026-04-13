{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    wget
    git
    zip
    unzip
    unrar
    ffmpeg
    radeontop
    dust
    fastfetch
  ];
}
