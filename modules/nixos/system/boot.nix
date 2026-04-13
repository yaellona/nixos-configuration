{ pkgs, lib, ... }:
{
  flake.modules.nixos.boot = {
    boot = {
      plymouth = {
        enable = true;
      };
      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];

      loader.timeout = lib.mkDefault 0;

      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = 10;
      };
      kernelPackages = pkgs.linuxPackages_zen;
    };
  };
}
