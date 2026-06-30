{ lib, ... }:

{
  flake.modules.nixos.env = {
    programs.nix-ld.enable = true;

    environment.localBinInPath = true;

    environment.variables = {
      NIXOS_OZONE_WL = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      EDITOR = "hx";
      # HTTP_PROXY = "http://127.0.0.1:10808";
      # HTTPS_PROXY = "http://127.0.0.1:10808";

      MOZ_ENABLE_WAYLAND = "1";
      XMODIFIERS = lib.mkForce "@im=fcitx";
      QT_IM_MODULE = lib.mkForce "fcitx";
      TERMINAL = "kitty";
    };

    documentation = {
      nixos.enable = false;
    };
  };
}
