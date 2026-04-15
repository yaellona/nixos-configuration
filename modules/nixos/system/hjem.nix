{
  inputs,
  me,
  ...
}:
{
  flake.modules.nixos.hjem =
    { pkgs, ... }:
    {
      imports = [ inputs.hjem.nixosModules.default ];
      hjem = {
        linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
        clobberByDefault = true;
        users.${me.username} = {
          user = "${me.username}";
          directory = "/home/${me.username}";
          systemd.enable = true;
        };
      };
    };
}
