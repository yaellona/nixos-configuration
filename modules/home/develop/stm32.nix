{ pkgs, ... }:
{
  flake.homeManagerModules.stm32 = {
    home.packages = with pkgs; [
      stm32cubemx
      cmake
      gcc-arm-embedded
      stlink-tool
      stlink-gui
      minicom
    ];
  };
}
