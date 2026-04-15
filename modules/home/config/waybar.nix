{ me, pkgs, ... }:
{
  flake.modules.hjem.waybar = {
    xdg.config.files = {
      "waybar/config".text = builtins.toJSON {
        layer = "top";
        position = "top";
        orientation = "horizontal";
        fixed-center = true;
        modules-left = [
          "niri/workspaces"
          "cpu"
          "memory"
          "custom/div_left"
        ];
        modules-center = [
          "custom/div_right"
          "network"
          "bluetooth"
          "clock"
          "power-profiles-daemon"
          "idle_inhibitor"
          "custom/div_left"
        ];
        modules-right = [
          "custom/div_right"
          "tray"
          "battery"
          "pulseaudio"
          "backlight"
          "custom/swaync"
        ];
        battery = {
          interval = 5;
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{icon} {capacity:2}%";
          format-charging = "󰂄 {capacity:2}%";
          format-plugged = "󰚥 {capacity:2}%";
          format-alt = "{icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip = false;
        };
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        "niri/workspaces" = {
          all-outputs = true;
          expand = false;
          format = "{icon}";
          format-icons = {
            default = "";
            Browser = "󰆋";
            Chat = "";
            Code = "";
            Game = "󰺵";
            Work = "";
          };
          tooltip = true;
        };
        tray = {
          icon-size = 14;
          spacing = 12;
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip-format-activated = "idle Disabled";
          tooltip-format-deactivated = "idle Enabled";
        };
        network = {
          format-disabled = "{icon}";
          format-disconnected = "{icon}";
          format-wifi = "{icon}";
          format-ethernet = "{icon}";
          format-icons = {
            disconnected = "󰤮";
            disabled = "󰤮";
            wifi = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            ethernet = "󰈀";
          };
          on-click = "${pkgs.nmgui}/bin/nmgui";
        };
        bluetooth = {
          format-disabled = "󰂲";
          format = "󰂯";
          format-connected = "󰂱";
          on-click = "kitty bluetui";
        };
        backlight = {
          scroll-step = 5;
          tooltip = false;
          format = "{icon} {percent:2}%";
          format-icons = [
            "󰛩"
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];
          on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
          on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        };
        pulseaudio = {
          format = "{icon} {volume:2}%";
          format-muted = "󰝟";
          format-bluetooth = "";
          tooltip = false;
          format-icons = {
            headphone = "";
            bluetooth = "";
            speaker = [
              ""
              ""
              ""
            ];
          };
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
        };
        clock = {
          interval = 60;
          format = " {:%H:%M}";
          tooltip = true;
          tooltip-format = " {:%Y-%m-%d}";
        };
        cpu = {
          interval = 3;
          format = " {usage:2}%";
          tooltip = true;
          on-click = "kitty btop";
        };
        memory = {
          interval = 3;
          format = " {:2}%";
          tooltip = true;
          tooltip-format = "RAM: {used}G / {total}G\nSwap: {swapUsed}G / {swapTotal}G";
          on-click = "kitty btop";
        };
        "custom/swaync" = {
          format = "󱄅";
          tooltip = false;
        };
        "custom/div_left" = {
          format = "";
          tooltip = false;
        };
        "custom/div_right" = {
          format = "";
          tooltip = false;
        };
      };
      "waybar/style.css".text =
        #css
        ''
          @import url("file:///home/${me.username}/.config/waybar/matugen-colors.css");

          * {
            font-family: "JetBrainsMono Nerd Font", monospace;
            font-size: 14px;
          }
          window#waybar {
            background: transparent;
            color: @on_surface;
            border-top: 0.5em solid @surface_container_high;
          }
          tooltip {
            background: alpha(@surface_container, 0.8);
            border: 0.17em solid @on_surface;
            border-radius: 0.4em;
            opacity: 0.8;
          }
          tooltip label {
            color: @on_surface;
            font-size: 0.89em;
          }
          #workspaces button {
            padding: 0px 0.56em;
            border-radius: 0.8em;
            transition: all 0.3s ease;
            color: @on_surface_variant;
          }
          #workspaces button:hover {
            color: @on_surface;
          }
          #workspaces button.active {
            color: @on_surface;
          }
          #network,
          #battery,
          #pulseaudio,
          #backlight,
          #bluetooth,
          #cpu,
          #memory,
          #clock,
          #tray,
          #power-profiles-daemon,
          #idle_inhibitor,
          #custom-swaync,
          #workspaces {
            padding: 0 0.7em;
            background: @surface_container_high;
          }
          #network { color: @tertiary; }
          #battery { color: @tertiary; }
          #pulseaudio { color: @secondary; }
          #backlight { color: @primary_container; }
          #bluetooth { color: @primary; }
          #cpu { color: @secondary; }
          #memory { color: @primary_container; }
          #clock { color: @on_surface; }
          #tray { color: @on_surface_variant; }
          #custom-swaync { color: @on_surface; }
          #power-profiles-daemon,
          #idle_inhibitor {
            color: @on_surface;
          }
          #power-profiles-daemon.performance {
            color: @error;
          }
          #power-profiles-daemon.balanced {
            color: @primary;
          }
          #power-profiles-daemon.power-saver {
            color: @tertiary;
          }
          #custom-div_left,
          #custom-div_right {
            font-size: 1.44em;
            color: @surface_container_high;
          }
        '';
    };
  };
}
