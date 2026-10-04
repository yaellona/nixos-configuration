{
  flake.modules.homeManager.lazygit = {
    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
