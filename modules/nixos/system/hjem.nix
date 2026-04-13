{
  inputs,
  config,
  me,
  ...
}:
{
  flake.modules.nixos.hjem =
    { pkgs, ... }:
    {
      imports = [ inputs.hjem.nixosModules.default ];
      hjem = {
        # linker = pkgs.smfh;
        linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
        clobberByDefault = true;
        users.${me.username} = {
          user = "${me.username}";
          directory = "/home/${me.username}";
          # If enabled, can't use home-manager service modules.
          systemd.enable = true;
          # rum.environment.hideWarning = true;
        };
      };
    };
}
