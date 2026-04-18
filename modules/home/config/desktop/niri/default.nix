{ lib, me, pkgs, ... }:
let
  binds = import ./_binds.nix { inherit pkgs lib; };
  startup = import ./_startup.nix { inherit pkgs lib; };
  settings = import ./_settings.nix { inherit pkgs lib; };
  rules = import ./_rules.nix { };
in
{
  flake.homeManagerModules.niri-flake = {
    xdg.configFile."niri/config.kdl".text =
      #kdl
      ''
        ${settings}
        ${startup}
        ${binds}
        ${rules}
      '';
  };
}
