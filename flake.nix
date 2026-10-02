{
  description = "kaelwen的nixos配置";
  inputs = {
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    nixpkgs.url = "nixpkgs/nixos-26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    coclash.url = "github:yaellona/coclash";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      import-tree = import ./lib/recursivelyImport.nix { lib = inputs.nixpkgs.lib; };
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = import-tree [
        ./modules/flake-parts
        inputs.flake-parts.flakeModules.modules
        {
          _module.args = {
            inherit inputs self nixpkgs;
            assets = ./assets;
            pkgs = import inputs.nixpkgs {
              system = "x86_64-linux";
              config = {
                allowUnfree = true;
              };
            };
            pkgs-unstable = import inputs.nixpkgs-unstable {
              system = "x86_64-linux";
              config = {
                allowUnfree = true;
              };
            };
          };
        }
        ./modules/nixos
        ./modules/home
        ./modules/hosts
      ];
    };
}
