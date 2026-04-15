{ pkgs, wallpaper, mode ? "dark" }:

let
  colorsJson = if wallpaper != null then
    pkgs.runCommandLocal "matugen-colors.json" { } ''
      ${pkgs.imagemagick}/bin/magick "${wallpaper}" wall.png
      ${pkgs.matugen}/bin/matugen image wall.png --mode ${mode} --json hex --source-color-index 0 > $out
    ''
  else
    pkgs.runCommandLocal "matugen-colors.json" { } ''
      ${pkgs.matugen}/bin/matugen color hex "#89b4fa" --mode ${mode} --json hex > $out
    '';

  rawColors = builtins.fromJSON (builtins.readFile colorsJson);

  extractColor = v:
    if builtins.isString v then v
    else if builtins.isAttrs v then
      let
        variant = v.${mode} or v.default or v.dark or v;
      in
      if builtins.isString variant then variant
      else if builtins.isAttrs variant then variant.color or "#000000"
      else "#000000"
    else "#000000";

  colors = builtins.mapAttrs (_: extractColor) (rawColors.colors or { });

  terminalColors = {
    color0  = colors.surface_dim or colors.outline_variant or "#45475a";
    color1  = colors.error or "#f38ba8";
    color2  = colors.tertiary or colors.secondary or "#a6e3a1";
    color3  = colors.inverse_primary or colors.primary_container or "#fab387";
    color4  = colors.primary or "#89b4fa";
    color5  = colors.secondary or "#cba6f7";
    color6  = colors.on_primary_container or colors.tertiary or "#94e2d5";
    color7  = colors.on_surface_variant or "#a6adc8";
    color8  = colors.outline or "#585b70";
    color9  = colors.error_container or "#eba0ac";
    color10 = colors.tertiary_container or colors.on_tertiary or "#a6e3a1";
    color11 = colors.primary_container or colors.on_primary_container or "#f9e2af";
    color12 = colors.on_primary or colors.primary or "#89dceb";
    color13 = colors.on_secondary_container or colors.on_secondary or "#f5c2e7";
    color14 = colors.on_tertiary_container or colors.on_tertiary or "#94e2d5";
    color15 = colors.on_surface or "#cdd6f4";
  };
in
colors // terminalColors
