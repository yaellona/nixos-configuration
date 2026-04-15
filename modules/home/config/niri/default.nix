{ me, pkgs, ... }:

{
  flake.modules.hjem.niri-flake = {
    imports = [ ./_binds.nix ];
    xdg.config.files."niri/config.kdl".source = ./dotfiles/config.kdl;
  };
}
