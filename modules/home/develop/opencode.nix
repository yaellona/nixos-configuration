{
  flake.homeManagerModules.opencode =
    { pkgs-unstable, ... }:
    {
      programs.opencode = {
        enable = true;
        package = pkgs-unstable.opencode;
      };
    };
}
