{ config, ... }:
#kdl
''
  layer-rule {
        match namespace="waybar"
        shadow {
              off
        }
      }
      layer-rule {
          match namespace="^notifications$"
          block-out-from "screencast"
      }
      layer-rule {
          match namespace="^awww*"
          match namespace="^noctalia-wallpaper*"
          place-within-backdrop true
      }

      window-rule {
          match is-focused=false
          opacity 0.8
      }
      /*
      window-rule {
          match is-focused=true
          draw-border-with-background false
          geometry-corner-radius 0
          clip-to-geometry true
          shadow {
              on
              softness 10
              spread 8
              offset x=0 y=0
              draw-behind-window false
              color "#${config.lib.stylix.colors.base0E}"
          }
      }
      */
      window-rule {
          match app-id="com.network.manager"
          match app-id="connman-gtk"
          match app-id="fcitx"
          match app-id="mpv"
          match app-id="org.gnome.FileRoller"
          match app-id="org.kde.polkit-kde-authentication-agent-1"
          match app-id="org.keepassxc.KeePassXC"
          match app-id="QtScrcpy"
          match app-id="xdg-desktop-portal-gtk"
          match app-id="blueberry"
          match app-id="copyq"
          match app-id="waypaper"
          open-floating true
      }
      window-rule {
          match app-id="Waydroid"
          match app-id="gamescope"
          match app-id="r#'^steam_app'#"
          match app-id=".gamescope-wrapped"
          open-fullscreen true
      }
      /*
      window-rule {
          match app-id="steam"
          match title="r#'^notificationtoasts_d+_desktop$'#"
          default-floating-position relative-to="bottom-right" x=10 y=10
      }
      */
      window-rule {
          match app-id="r#'^org.keepassxc.KeePassXC$'#"
          match app-id="r#'^org.gnome.World.Secrets$'#"
          block-out-from "screen-capture"
      }

      workspace "Browser"
      workspace "Chat"
      workspace "Code"
      workspace "Game"
      workspace "Work"
      window-rule {
          match app-id="firefox"
          match app-id="librewolf"
          match app-id="zen-twilight"
          match app-id="chromium-browser"
          match app-id="io.github.ungoogled_software.ungoogled_chromium"
          open-on-workspace "Browser"
          open-maximized true
      }
      window-rule {
          match title="r#'.*Lapce$'#"
          match app-id="code"
          match app-id="Code"
          match app-id="codium"
          match app-id="dev.zed.Zed"
          match app-id="jetbrains-pycharm"
          open-on-workspace "Code"
          open-maximized true
      }
      window-rule {
          match app-id="thunderbird"
          match app-id="wechat"
          match app-id="org.telegram.desktop"
          match app-id="QQ"
          match app-id="com.alibabainc.dingtalk"
          match app-id="wemeetapp"
          open-on-workspace "Chat"
      }
      window-rule {
          match app-id="heroic"
          match app-id="steam"
          match app-id="r#'^steam_app'#"
          match app-id=".gamescope-wrapped"
          match app-id="^osu"
          match app-id="org.prismlauncher.PrismLauncher"
          match app-id="org.jackhuang.hmcl.Launcher"
          open-on-workspace "Game"
      }
      window-rule {
          match app-id="^libreoffice"
          match app-id="Microsoft Windows"
          match app-id="org.kde.kdenlive"
          match app-id="org.inkscape.Inkscape"
          match app-id="gimp"
          match app-id="krita"
          match app-id="resolve"
          match app-id="affinity.exe"
          open-on-workspace "Work"
          open-maximized true
      }
      window-rule {
          background-effect {
              blur true
          }
      }
''
