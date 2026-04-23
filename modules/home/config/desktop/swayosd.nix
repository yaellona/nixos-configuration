{
  flake.homeManagerModules.swayosd =
    { config, lib, ... }:
    {
      services.swayosd = {
        enable = true;
        stylePath = lib.mkForce (
          builtins.toFile "swayosd-style.css" # css
            ''
              window#osd {
                border-radius: 999px;
                border: none;
                background: alpha(#${config.lib.stylix.colors.base00}, 0.85);

                #container { margin: 16px; }

                image, label {
                  color: #${config.lib.stylix.colors.base05};
                }

                progressbar:disabled, image:disabled { opacity: 0.5; }

                progressbar, segmentedprogress {
                  min-height: 6px;
                  border-radius: 999px;
                  background: transparent;
                  border: none;
                }
                trough, segment {
                  min-height: inherit;
                  border-radius: inherit;
                  border: none;
                  background: alpha(#${config.lib.stylix.colors.base04}, 0.5);
                }
                progress, segment.active {
                  min-height: inherit;
                  border-radius: inherit;
                  border: none;
                  background: #${config.lib.stylix.colors.base0D};
                }

                segment {
                  margin-left: 8px;
                }
                segment:first-child { margin-left: 0; }
              }
            ''
        );
      };
    };
}
