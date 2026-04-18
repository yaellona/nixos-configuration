{ lib, ... }:
{
  options.flake.hosts = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options = {
        modules = lib.mkOption {
          type = lib.types.listOf lib.types.deferredModule;
          default = [ ];
          description = "Extra NixOS modules for this host.";
        };
        homeModules = lib.mkOption {
          type = lib.types.listOf lib.types.deferredModule;
          default = [ ];
          description = "Extra home-manager modules for this host.";
        };
      };
    });
    default = { };
    description = "Host definitions consumed by the builder.";
  };

  options.flake.homeManagerModules = lib.mkOption {
    type = lib.types.attrsOf lib.types.deferredModule;
    default = { };
    description = "home-manager modules shared across all hosts.";
  };
}
