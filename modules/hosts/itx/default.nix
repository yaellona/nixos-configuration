{ ... }:
{
  flake.modules.nixos.host = {
    imports = [ ./_hardware-configuration.nix ];
  };
}
