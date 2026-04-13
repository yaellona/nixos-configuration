#这是我的itx小主机的配置

{
  inputs,
  config,
  self,
  ...
}:
{
  imports = [
    ../config.nix
  ];
  flake.nixosConfigurations.${config.me.hostname} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit inputs self;
      me = config.me;
    };
    modules = [
      ../../modules/nixos
      ./hardware-configuration.nix
    ];
  };
}
