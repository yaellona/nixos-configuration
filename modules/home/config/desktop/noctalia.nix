{
  flake.homeManagerModules.noctalia =
    {
      inputs,
      config,
      pkgs,
      lib,
      ...
    }:
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia = {
        enable = true;
        systemd.enable = true;

        settings = {
          shell.avatar_path = ../../../../assets/head/Frieren.png;

          wallpaper.directory = ../../../../assets/waypapers;

          theme = {
            mode = "dark";
            source = "custom";
            custom_palette = "stylix";
          };
        };

        customPalettes.stylix = {
          dark = with config.lib.stylix.colors.withHashtag; {
            mError = lib.mkForce base08;
            mOnError = lib.mkForce base00;
            mOnPrimary = lib.mkForce base00;
            mOnSecondary = lib.mkForce base01;
            mOnSurface = lib.mkForce base05;
            mOnSurfaceVariant = lib.mkForce base07;
            mOnTertiary = lib.mkForce base02;
            mOutline = lib.mkForce base02;
            mPrimary = lib.mkForce base07;
            mSecondary = lib.mkForce base06;
            mShadow = lib.mkForce "#000000";
            mSurface = lib.mkForce base01;
            mSurfaceVariant = lib.mkForce base01;
            mTertiary = lib.mkForce base0B;
            mHover = lib.mkForce base0D;
            mOnHover = lib.mkForce base00;
            terminal = {
              foreground = lib.mkForce base05;
              background = lib.mkForce base00;
              cursor = lib.mkForce base0D;
              cursorText = lib.mkForce base00;
              selectionFg = lib.mkForce base05;
              selectionBg = lib.mkForce base0D;
              normal = {
                black = lib.mkForce base00;
                red = lib.mkForce base08;
                green = lib.mkForce base0B;
                yellow = lib.mkForce base0A;
                blue = lib.mkForce base0D;
                magenta = lib.mkForce base0E;
                cyan = lib.mkForce base0C;
                white = lib.mkForce base05;
              };
              bright = {
                black = lib.mkForce base03;
                red = lib.mkForce base08;
                green = lib.mkForce base0B;
                yellow = lib.mkForce base0A;
                blue = lib.mkForce base0D;
                magenta = lib.mkForce base0E;
                cyan = lib.mkForce base0C;
                white = lib.mkForce base07;
              };
            };
          };
        };
      };
    };
}
