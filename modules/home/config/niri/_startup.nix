{ pkgs, lib, ... }:
#kdl
''
  spawn-at-startup "${lib.getExe pkgs.waypaper}" "--restore"
  spawn-at-startup "fcitx5" "-d"
  spawn-at-startup "wl-paste" "--watch" "cliphist" "store"
  spawn-at-startup "${lib.getExe pkgs.waybar}"
  spawn-at-startup "${pkgs.swayosd}/bin/swayosd-server"
''
