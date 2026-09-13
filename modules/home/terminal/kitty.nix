{
  flake.homeManagerModules.kitty = {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration = {
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
      settings = {
        cursor_shape = "beam";
        cursor_trail = 1;
        cursor_trail_start_threshold = 0;
      };
    };
  };
}
