{
  flake.homeManagerModules.swaylock =
    { pkgs, config, ... }:
    {
      programs.swaylock = {
        enable = true;
        package = pkgs.swaylock-effects;

      };
      xdg.configFile."swaylock/config".text = ''
        screenshots
        clock
        indicator
        indicator-radius=200
        indicator-thickness=15
        effect-blur=10x5
        font=${config.stylix.fonts.monospace.name}
      '';
    };
}
