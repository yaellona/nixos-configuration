{ pkgs, ... }:
{
  flake.modules.nixos.thunar = {
    programs.thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };
    services.tumbler.enable = true;
    environment.systemPackages = with pkgs; [
      ffmpegthumbnailer
      bign-handheld-thumbnailer
      file-roller
    ];
  };
}
