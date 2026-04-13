{ pkgs, ... }:
{
  flake.modules.nixos.bluetooth = {
    hardware.bluetooth.enable = true;
    environment.systemPackages = with pkgs; [ bluetui ];
  };
}
