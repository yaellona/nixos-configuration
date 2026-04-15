{
  pkgs,
  ...
}:
let
  font_pkgs = with pkgs; [
    wqy_microhei
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    maple-mono.NF-CN
    nerd-fonts.iosevka
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    lxgw-wenkai
    corefonts
  ];
in
{
  flake.modules.nixos.fonts = {
    fonts = {
      enableDefaultPackages = true;

      fontDir.enable = true;
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "LXGW WenKai" ];
          sansSerif = [ "LXGW WenKai" ];
          monospace = [ "Maple Mono NF CN" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };

      packages = font_pkgs;
    };
  };
}
