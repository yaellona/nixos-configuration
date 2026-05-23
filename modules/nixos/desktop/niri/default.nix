{ pkgs, ... }:
{
  flake.modules.nixos.niri = {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };

    # services.displayManager.gdm = {
    #   enable = true;
    # };
    services.displayManager.ly = {
      enable = true;
    };

    # environment.systemPackages = with pkgs; [
    #   mpv
    # ];
  };
}
