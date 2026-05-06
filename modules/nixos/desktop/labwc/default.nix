{
  flake.modules.nixos.labwc = {
    programs.labwc = {
      enable = true;
    };
    services.desktopManager.gnome = {
      enable = true;
    };
  };
}
