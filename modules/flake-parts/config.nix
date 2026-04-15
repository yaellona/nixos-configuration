{ lib, config, ... }:
let
  userSubmodule = lib.types.submodule {
    options = {
      username = lib.mkOption {
        type = lib.types.str;
      };
      hostname = lib.mkOption {
        type = lib.types.str;
      };
      email = lib.mkOption {
        type = lib.types.str;
      };
      sshKey = lib.mkOption {
        type = lib.types.str;
        description = ''
          SSH public key
        '';
      };
      wallpaper = lib.mkOption {
        type = lib.types.nullOr lib.types.path;
        default = null;
        description = "Wallpaper image path for matugen theme generation.";
      };
    };
  };
in
{
  imports = [
    ../../config.nix
  ];
  config._module.args.me = config.me;
  options = {
    me = lib.mkOption {
      type = userSubmodule;
    };
  };
}
