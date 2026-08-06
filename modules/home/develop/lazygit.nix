{
  flake.homeManagerModules.lazygit = {
    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
