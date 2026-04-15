{ ... }:
{
  flake.modules.hjem.kitty = {
    xdg.config.files."kitty/kitty.conf".text =
      #conf
      ''
        cursor_shape beam
        cursor_trail 1
        cursor_trail_start_threshold 0
        background_opacity 0.9

        tab_bar_edge          top
        tab_bar_style         powerline
        tab_powerline_style   slanted

        include matugen-colors.conf
      '';
  };
}
