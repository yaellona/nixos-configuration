{
  flake.modules.homeManager.opencode =
    { pkgs-unstable, ... }:
    {
      programs.opencode = {
        enable = true;
        package = pkgs-unstable.opencode;
      };
    };
}
