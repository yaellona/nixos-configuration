{
  inputs,
  config,
  self,
  me,
  assets,
  pkgs-unstable,
  ...
}:
{
  flake.nixosConfigurations.${me.hostname} =
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs self me; };
      modules = [
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs assets pkgs-unstable me; };
            users.${me.username} = {
              home.username = me.username;
              home.homeDirectory = "/home/${me.username}";
              home.stateVersion = "26.05";
              programs.home-manager.enable = true;
            };
            sharedModules = builtins.attrValues config.flake.modules.homeManager;
          };
        }
      ] ++ builtins.attrValues config.flake.modules.nixos;
    };
}
