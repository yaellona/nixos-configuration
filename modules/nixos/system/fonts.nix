{
  pkgs,
  ...
}:
let
  font_pkgs = with pkgs; [
    wqy_microhei
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    corefonts
  ];
in
{
  flake.modules.nixos.fonts = {
    fonts = {
      enableDefaultPackages = true;
      fontconfig.enable = true;
      fontDir.enable = true;
      packages = font_pkgs;
    };
  };
}
