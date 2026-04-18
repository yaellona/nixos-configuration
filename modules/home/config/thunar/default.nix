{
  flake.homeManagerModules.thunar = {
    xdg.configFile."Thunar/uca.xml".source = ./uca.xml;
  };
}
