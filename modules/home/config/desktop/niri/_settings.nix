{ pkgs, lib, ... }:
#kdl
''
  prefer-no-csd
      hotkey-overlay {
          skip-at-startup
          hide-not-bound
      }
      xwayland-satellite {
          // off
          path "${lib.getExe pkgs.xwayland-satellite}"
      }
      gestures {
          hot-corners {
              off
          }
      }
      layout {
          gaps 8
          background-color "transparent"
          center-focused-column "on-overflow"
          always-center-single-column
          preset-column-widths {
              proportion 0.5
              proportion 0.7
              proportion 1.0
          }
          default-column-width {
              proportion 0.5
          }
          focus-ring {
              off
              width 3
              active-gradient angle=45 from="#ca9ee6" relative-to="window" to="#85c1dc"
              inactive-color "#505050"
          }
      }
  screenshot-path "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png"
''
