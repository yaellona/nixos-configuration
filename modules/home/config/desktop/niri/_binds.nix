{ pkgs, lib, ... }:
let
  Custom_binds =
    #kdl
    ''
      Mod+Alt+L hotkey-overlay-title="锁屏" repeat=false {
          spawn "swaylock"
      }
      Mod+C hotkey-overlay-title="打开剪切板" repeat=false {
          spawn "${../../scripts/clip.sh}"
      }
      Mod+D hotkey-overlay-title="打开搜索" repeat=false {
          spawn "${lib.getExe pkgs.fuzzel}"
      }
      Mod+W hotkey-overlay-title="打开壁纸选择器" repeat=false {
          spawn "${lib.getExe pkgs.waypaper}"
      }
      XF86AudioLowerVolume allow-when-locked=true {
          spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-"
        }
      XF86AudioMicMute allow-when-locked=true {
          spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"
      }
      XF86AudioMute allow-when-locked=true {
          spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"
      }
      XF86AudioRaiseVolume allow-when-locked=true {
          spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05+"
        }
      XF86MonBrightnessDown allow-when-locked=true {
          spawn "${lib.getExe pkgs.brightnessctl}" "set" "5%-"
      }
      XF86MonBrightnessUp allow-when-locked=true {
          spawn "${lib.getExe pkgs.brightnessctl}" "set" "5%+"
      }
      Mod+Ctrl+R hotkey-overlay-title="随机壁纸" {
          spawn "${lib.getExe pkgs.waypaper}" "--random"
      }
      Mod+T hotkey-overlay-title="打开终端" repeat=false {
          spawn "${lib.getExe pkgs.kitty}"
      }
      Mod+E hotkey-overlay-title="打开文件管理器" repeat=false {
          spawn "${lib.getExe pkgs.thunar}"
      }
    '';

  noc_ipc = ''"noctalia-shell" "ipc" "call"'';
  Custom_noc_binds =
    #kdl
    ''
      Mod+Alt+L hotkey-overlay-title="锁屏" repeat=false {
          spawn ${noc_ipc} "lockScreen" "lock"
      }
      Mod+C hotkey-overlay-title="打开剪切板" repeat=false {
          spawn ${noc_ipc} "launcher" "clipboard"
      }
      Mod+D hotkey-overlay-title="打开搜索" repeat=false {
          spawn ${noc_ipc} "launcher" "toggle"
      }
      Mod+W hotkey-overlay-title="打开壁纸选择器" repeat=false {
          spawn ${noc_ipc} "wallpaper" "toggle"
      }
      XF86AudioLowerVolume allow-when-locked=true {
          spawn ${noc_ipc} "volume" "decrease"
      }
      XF86AudioMicMute allow-when-locked=true {
          spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"
      }
      XF86AudioMute allow-when-locked=true {
          spawn ${noc_ipc} "volume" "muteOutput"
      }
      XF86AudioRaiseVolume allow-when-locked=true {
          spawn ${noc_ipc} "volume" "increase"
      }
      XF86MonBrightnessDown allow-when-locked=true {
          spawn ${noc_ipc} "brightness" "decrease"
      }
      XF86MonBrightnessUp allow-when-locked=true {
          spawn ${noc_ipc} "brightness" "increase"
      }
      Mod+T hotkey-overlay-title="打开终端" repeat=false {
          spawn "${lib.getExe pkgs.kitty}"
      }
      Mod+E hotkey-overlay-title="打开文件管理器" repeat=false {
          spawn "${lib.getExe pkgs.thunar}"
      }
    '';

  Fixed_binds =
    #kdl
    ''
      Alt+Print {
      screenshot-window
      }
      Alt+Tab {
      focus-workspace-previous
      }
      Ctrl+Print {
      screenshot-screen
      }
      Print {
      screenshot
      }
      Mod+0 {
      focus-workspace 0
      }
      Mod+1 {
      focus-workspace 1
      }
      Mod+2 {
      focus-workspace 2
      }
      Mod+3 {
      focus-workspace 3
      }
      Mod+4 {
      focus-workspace 4
      }
      Mod+5 {
      focus-workspace 5
      }
      Mod+6 {
      focus-workspace 6
      }
      Mod+7 {
      focus-workspace 7
      }
      Mod+8 {
      focus-workspace 8
      }
      Mod+9 {
      focus-workspace 9
      }
      Mod+Ctrl+C hotkey-overlay-title="将窗口移至中央" {
        center-column
      }
      Mod+Ctrl+F hotkey-overlay-title="使窗口悬浮" {
      toggle-window-floating
      }
      Mod+Ctrl+K hotkey-overlay-title="上移窗口" {
      move-window-up
      }
      Mod+Ctrl+Up hotkey-overlay-title="上移窗口" {
      move-window-up
      }
      Mod+Ctrl+J hotkey-overlay-title="下移窗口" {
      move-window-down
      }
      Mod+Ctrl+Down hotkey-overlay-title="下移窗口" {
      move-window-down
      }
      Mod+Ctrl+H hotkey-overlay-title="左移窗口" {
      move-column-left
      }
      Mod+Ctrl+Left hotkey-overlay-title="左移窗口" {
      move-column-left
      }
      Mod+Ctrl+L hotkey-overlay-title="右移窗口" {
      move-column-right
      }
      Mod+Ctrl+Right hotkey-overlay-title="右移窗口" {
      move-column-right
      }
      Mod+Ctrl+End {
      move-column-to-last
      }
      Mod+Ctrl+Home {
      move-column-to-first
      }
      Mod+Ctrl+Page_Down hotkey-overlay-title="窗口移至下一工作区" {
      move-column-to-workspace-down
      }
      Mod+Ctrl+Page_Up hotkey-overlay-title="窗口移至上一工作区" {
      move-column-to-workspace-up
      }
      Mod+F hotkey-overlay-title="窗口最大化" {
      maximize-column
      }
      Mod+Q hotkey-overlay-title="关闭窗口" repeat=false {
      close-window
      }
      Mod+R hotkey-overlay-title="更改窗口大小" {
      switch-preset-column-width
      }
      Mod+K hotkey-overlay-title="切换到上侧窗口" {
      focus-window-up
      }
      Mod+Up hotkey-overlay-title="切换到上侧窗口" {
      focus-window-up
      }
      Mod+J hotkey-overlay-title="切换到下侧窗口" {
      focus-window-down
      }
      Mod+Down hotkey-overlay-title="切换到下侧窗口" {
      focus-window-down
      }
      Mod+H hotkey-overlay-title="切换到左侧窗口" {
      focus-column-left
      }
      Mod+Left hotkey-overlay-title="切换到左侧窗口" {
      focus-column-left
      }
      Mod+L hotkey-overlay-title="切换到右侧窗口" {
      focus-column-right
      }
      Mod+Right hotkey-overlay-title="切换到右侧窗口" {
      focus-column-right
      }
      Mod+End hotkey-overlay-title="切换到该工作区的最后一个窗口" {
      focus-column-last
      }
      Mod+Equal hotkey-overlay-title="增大窗口宽度" {
      set-column-width "+5%"
      }
      Mod+Escape hotkey-overlay-title="总览" repeat=false {
      toggle-overview
      }
      Mod+Home hotkey-overlay-title="切换到该工作区的第一个窗口" {
      focus-column-first
      }
      Mod+Minus hotkey-overlay-title="减小窗口宽度" {
      set-column-width "-5%"
      }
      Mod+Page_Up hotkey-overlay-title="切换到上一个工作区" {
      focus-workspace-up
      }
      Mod+Page_Down hotkey-overlay-title="切换到下一个工作区" {
      focus-workspace-down
      }
      Mod+Alt+Space hotkey-overlay-title="显示提示" {
      show-hotkey-overlay
      }
      Mod+Shift+0 {
      move-column-to-workspace 0
      }
      Mod+Shift+1 {
      move-column-to-workspace 1
      }
      Mod+Shift+2 {
      move-column-to-workspace 2
      }
      Mod+Shift+3 {
      move-column-to-workspace 3
      }
      Mod+Shift+4 {
      move-column-to-workspace 4
      }
      Mod+Shift+5 {
      move-column-to-workspace 5
      }
      Mod+Shift+6 {
      move-column-to-workspace 6
      }
      Mod+Shift+7 {
      move-column-to-workspace 7
      }
      Mod+Shift+8 {
      move-column-to-workspace 8
      }
      Mod+Shift+9 {
      move-column-to-workspace 9
      }
      Mod+Shift+Ctrl+H {
      move-column-to-monitor-left
      }
      Mod+Shift+Ctrl+J {
      move-column-to-monitor-down
      }
      Mod+Shift+Ctrl+K {
      move-column-to-monitor-up
      }
      Mod+Shift+Ctrl+L {
      move-column-to-monitor-right
      }
      Mod+Shift+Ctrl+Down {
      move-column-to-monitor-down
      }
      Mod+Shift+Ctrl+Left {
      move-column-to-monitor-left
      }
      Mod+Shift+Ctrl+Right {
      move-column-to-monitor-right
      }
      Mod+Shift+Ctrl+Up {
      move-column-to-monitor-up
      }
      Mod+Shift+H {
      focus-monitor-left
      }
      Mod+Shift+J {
      focus-monitor-down
      }
      Mod+Shift+K {
      focus-monitor-up
      }
      Mod+Shift+L {
      focus-monitor-right
      }
      Mod+Shift+E hotkey-overlay-title="退出" {
      quit
      }
      Mod+Shift+F hotkey-overlay-title="窗口全屏" {
      fullscreen-window
      }
      Mod+Shift+S hotkey-overlay-title="截图" {
      screenshot
      }
      Mod+Shift+Down {
      focus-monitor-down
      }
      Mod+Shift+Left {
      focus-monitor-left
      }
      Mod+Shift+Right {
      focus-monitor-right
      }
      Mod+Shift+Up {
      focus-monitor-up
      }
      Mod+Shift+Equal hotkey-overlay-title="增大窗口高度" {
      set-window-height "+5%"
      }
      Mod+Shift+Minus hotkey-overlay-title="减小窗口高度" {
      set-window-height "-5%"
      }
      Mod+Shift+WheelScrollDown cooldown-ms=150 {
      focus-column-right
      }
      Mod+Shift+WheelScrollUp cooldown-ms=150 {
      focus-column-left
      }
      Mod+WheelScrollDown cooldown-ms=150 {
      focus-workspace-down
      }
      Mod+WheelScrollLeft cooldown-ms=150 {
      focus-column-left
      }
      Mod+WheelScrollRight cooldown-ms=150 {
      focus-column-right
      }
      Mod+WheelScrollUp cooldown-ms=150 {
      focus-workspace-up
      }
    '';
in
#kdl
''
  binds {
  ${Fixed_binds} 
  ${Custom_binds}
  }
''
