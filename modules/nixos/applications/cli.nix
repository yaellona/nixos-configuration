{ pkgs, ... }:
{
  flake.modules.nixos.cli = {
    environment.systemPackages = with pkgs; [
      wget
      git
      zip
      unzip
      unrar
      ffmpeg
      radeontop
      dust
    ];
  };
}
