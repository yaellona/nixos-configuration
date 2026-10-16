{ pkgs, lib, ... }:
#kdl
''
  // 壁纸由 quickshell 自绘（quickshell-config-wallpaper 层），不再用 waypaper/awww
  // spawn-at-startup "${lib.getExe pkgs.waypaper}" "--restore"
  spawn-at-startup "fcitx5" "-d"
    // spawn-at-startup "noctalia"
  spawn-at-startup "wl-paste" "--watch" "cliphist" "store"
  // spawn-at-startup "${lib.getExe pkgs.waybar}"
  // OSD 由 quickshell 提供（quickshell-config-osd 层）
  // spawn-at-startup "${pkgs.swayosd}/bin/swayosd-server"
  // quickshell 由 systemd 启动：systemctl --user status yaellona-quickshell
''
