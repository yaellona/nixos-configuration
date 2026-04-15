{ ... }:

{
  flake.modules.nixos.env = {
    programs.nix-ld.enable = true;

    environment.localBinInPath = true;

    environment.variables = {
      NIXOS_OZONE_WL = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      EDITOR = "hx";
      MOZ_ENABLE_WAYLAND = "1";
    };

    documentation = {
      nixos.enable = false;
    };
  };
}
