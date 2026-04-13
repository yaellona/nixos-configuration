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
        hjemModules = lib.mkOption {
          type = lib.types.listOf lib.types.deferredModule;
          default = [ ];
          description = "Extra hjem modules for this host.";
        };
      };
    });
    default = { };
    description = "Host definitions consumed by the builder.";
  };
}
