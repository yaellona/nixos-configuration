{
  flake.homeManagerModules.labwc =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      colors = config.lib.stylix.colors;
    in
    {
      xdg.configFile."labwc/rc.xml".text =
        #xml
        ''
          <?xml version="1.0" ?>
          <labwc_config>
            <desktops number="9" />

            <keyboard>
              <default />
                <keybind key="W-q"><action name="Close" /></keybind>
              <keybind key="W-d">
                <action name="Execute" command="${lib.getExe pkgs.fuzzel}" />
              </keybind>
              <keybind key="W-t">
                <action name="Execute" command="${lib.getExe pkgs.kitty}" />
              </keybind>
             <keybind key="W-w">
                <action name="Execute" command="${lib.getExe pkgs.waypaper}" />
              </keybind>
             <keybind key="W-e">
                <action name="Execute" command="${lib.getExe pkgs.thunar}" />
              </keybind>
                <keybind key="W-A-L">
                <action name="Execute" command="${lib.getExe pkgs.swaylock-effects}" />
              </keybind>
                <keybind key="W-1"><action name="GoToDesktop" to="1" /></keybind>
              <keybind key="W-2"><action name="GoToDesktop" to="2" /></keybind>
              <keybind key="W-3"><action name="GoToDesktop" to="3" /></keybind>
              <keybind key="W-4"><action name="GoToDesktop" to="4" /></keybind>
              <keybind key="W-5"><action name="GoToDesktop" to="5" /></keybind>
              <keybind key="W-6"><action name="GoToDesktop" to="6" /></keybind>
              <keybind key="W-7"><action name="GoToDesktop" to="7" /></keybind>
              <keybind key="W-8"><action name="GoToDesktop" to="8" /></keybind>
              <keybind key="W-9"><action name="GoToDesktop" to="9" /></keybind>
              <keybind key="W-Page_Up"><action name="GoToDesktop" to="left" /></keybind>
                <keybind key="W-H"><action name="GoToDesktop" to="left" /></keybind>
              <keybind key="W-Page_Down"><action name="GoToDesktop" to="right" /></keybind>
                <keybind key="W-L"><action name="GoToDesktop" to="right" /></keybind>
              <keybind key="W-S-1"><action name="SendToDesktop" to="1" follow="yes" /></keybind>
              <keybind key="W-S-2"><action name="SendToDesktop" to="2" follow="yes" /></keybind>
              <keybind key="W-S-3"><action name="SendToDesktop" to="3" follow="yes" /></keybind>
              <keybind key="W-S-4"><action name="SendToDesktop" to="4" follow="yes" /></keybind>
              <keybind key="W-S-5"><action name="SendToDesktop" to="5" follow="yes" /></keybind>
              <keybind key="W-S-6"><action name="SendToDesktop" to="6" follow="yes" /></keybind>
              <keybind key="W-S-7"><action name="SendToDesktop" to="7" follow="yes" /></keybind>
              <keybind key="W-S-8"><action name="SendToDesktop" to="8" follow="yes" /></keybind>
              <keybind key="W-S-9"><action name="SendToDesktop" to="9" follow="yes" /></keybind>
            </keyboard>

            <!-- <mouse> -->
            <!--   <default /> -->
            <!--   <context name="Root"> -->
            <!--     <mousebind direction="W-Up" action="Scroll"> -->
            <!--       <action name="GoToDesktop" to="left" /> -->
            <!--     </mousebind> -->
            <!--     <mousebind direction="W-Down" action="Scroll"> -->
            <!--       <action name="GoToDesktop" to="right" /> -->
            <!--     </mousebind> -->
            <!--   </context> -->
            <!-- </mouse> -->

            <theme>
              <name>stylix</name>
            </theme>
          </labwc_config>
        '';

      xdg.configFile."labwc/autostart".text =
        #bash
        ''
          ${lib.getExe pkgs.waypaper} --restore &
          fcitx5 -d &
          ${lib.getExe pkgs.waybar} -c ~/.config/waybar/labwc.jsonc -s ~/.config/waybar/style.css &
        '';

      xdg.configFile."labwc/themerc".text =
        #theme
        ''
          border.width: 2

          window.active.border.color: #${colors.base0D}
          window.active.title.bg.color: #${colors.base00}
          window.active.label.text.color: #${colors.base05}
          window.active.button.unpressed.image.color: #${colors.base05}

          window.inactive.border.color: #${colors.base01}
          window.inactive.title.bg.color: #${colors.base00}
          window.inactive.label.text.color: #${colors.base04}
          window.inactive.button.unpressed.image.color: #${colors.base04}

          menu.items.bg.color: #${colors.base00}
          menu.items.text.color: #${colors.base05}
          menu.items.active.bg.color: #${colors.base0D}
          menu.items.active.text.color: #${colors.base00}
          menu.separator.color: #${colors.base02}

          osd.bg.color: #${colors.base00}
          osd.border.color: #${colors.base0D}
          osd.label.text.color: #${colors.base05}

          titlebar.height: 27
          corner.radius: 4
        '';

      xdg.configFile."waybar/labwc.jsonc".text =
        let
          json = builtins.toJSON;
        in
        #jsonc
        ''
          {
            "layer": "top",
            "position": "top",
            "orientation": "horizontal",
            "fixed-center": true,

            "modules-left": ["wlr/workspaces", "cpu", "memory"],
            "modules-center": ["custom/div_right", "network", "bluetooth", "clock", "power-profiles-daemon", "idle_inhibitor", "custom/div_left"],
            "modules-right": ["custom/div_right", "tray", "battery", "pulseaudio", "backlight", "custom/swaync"],

            "wlr/workspaces": {
              "all-outputs": true,
              "format": "{name}",
              "tooltip": false
            },

            "battery": {
              "interval": 5,
              "states": { "warning": 30, "critical": 10 },
              "format": "{icon} {capacity:2}%",
              "format-charging": " {capacity:2}%",
              "format-plugged": " {capacity:2}%",
              "format-icons": ["", "", "", "", ""],
              "tooltip": false
            },

            "power-profiles-daemon": {
              "format": "{icon}",
              "tooltip-format": "Power profile: {profile}\nDriver: {driver}",
              "tooltip": true,
              "format-icons": {
                "default": "",
                "performance": "",
                "balanced": "",
                "power-saver": ""
              }
            },

            "tray": { "icon-size": 14, "spacing": 12 },

            "idle_inhibitor": {
              "format": "{icon}",
              "format-icons": { "activated": "", "deactivated": "" },
              "tooltip-format-activated": "idle Disabled",
              "tooltip-format-deactivated": "idle Enabled"
            },

            "network": {
              "format-disabled": "{icon}",
              "format-disconnected": "{icon}",
              "format-wifi": "{icon}",
              "format-ethernet": "{icon}",
              "format-icons": {
                "disconnected": "󰤮",
                "disabled": "󰤮",
                "wifi": ["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"],
                "ethernet": "󰈀"
              },
              "on-click": "${lib.getExe pkgs.nmgui}"
            },

            "bluetooth": {
              "format-disabled": "󰂲",
              "format": "󰂯",
              "format-connected": "󰂱",
              "on-click": "kitty -e ${lib.getExe pkgs.bluetui}"
            },

            "backlight": {
              "scroll-step": 5,
              "tooltip": false,
              "format": "{icon} {percent:2}%",
              "format-icons": ["󰛩", "󱩎", "󱩏", "󱩐", "󱩑", "󱩒", "󱩓", "󱩔", "󱩕", "󱩖", "󰛨"],
              "on-scroll-up": "${lib.getExe pkgs.brightnessctl} set 5%+",
              "on-scroll-down": "${lib.getExe pkgs.brightnessctl} set 5%-"
            },

            "pulseaudio": {
              "format": "{icon} {volume:2}%",
              "format-muted": " ",
              "format-bluetooth": "",
              "tooltip": false,
              "format-icons": {
                "headphone": "",
                "bluetooth": "",
                "speaker": ["", "", ""]
              },
              "on-click": "${lib.getExe pkgs.pavucontrol} -t 3",
              "on-scroll-up": "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+",
              "on-scroll-down": "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"
            },

            "clock": {
              "interval": 60,
              "format": " {:%H:%M}",
              "tooltip": true,
              "tooltip-format": " {:%Y-%m-%d}"
            },

            "cpu": {
              "interval": 3,
              "format": " {usage:2}%",
              "tooltip": true,
              "on-click": "kitty -e btop"
            },

            "memory": {
              "interval": 3,
              "format": " {:2}%",
              "tooltip": true,
              "tooltip-format": "RAM: {used}G / {total}G\nSwap: {swapUsed}G / {swapTotal}G",
              "on-click": "kitty -e btop"
            },

            "custom/swaync": {
              "format": "󱄅",
              "tooltip": false,
              "on-click": "${lib.getExe pkgs.swaynotificationcenter}/bin/swaync-client -t"
            },

            "custom/div_left": { "format": "", "tooltip": false },
            "custom/div_right": { "format": "", "tooltip": false }
          }
        '';
    };
}
