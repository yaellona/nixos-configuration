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
  allHomeManagerModules = builtins.attrValues (cfg.homeManagerModules or { });

  buildHost =
    name: hostCfg:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs self;
        me = config.me;
      };
      modules = [
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
              me = config.me;
            };
            users.${config.me.username} = {
              home.username = config.me.username;
              home.homeDirectory = "/home/${config.me.username}";
              home.stateVersion = "26.05";
              programs.home-manager.enable = true;
            };
            sharedModules = allHomeManagerModules ++ hostCfg.homeModules;
          };
        }
      ]
      ++ allNixosModules
      ++ hostCfg.modules;
    };
in
{
  flake.nixosConfigurations = lib.mapAttrs buildHost (cfg.hosts or { });
}
