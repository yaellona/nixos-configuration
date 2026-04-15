{
  inputs,
  lib,
  config,
  self,
  ...
}:
let
  cfg = config.flake;
  allNixosModules = builtins.attrValues (cfg.modules.nixos or { });
  allHjemModules = builtins.attrValues (cfg.modules.hjem or { });

  buildHost =
    name: hostCfg:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs self;
        me = config.me;
      };
      modules =
        allNixosModules
        ++ hostCfg.modules
        ++ [
          {
            hjem.extraModules = allHjemModules ++ hostCfg.hjemModules;
          }
        ];
    };
in
{
  flake.nixosConfigurations = lib.mapAttrs buildHost (cfg.hosts or { });
}
