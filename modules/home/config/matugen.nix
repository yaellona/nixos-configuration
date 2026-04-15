{ me, ... }:

let
  home = "/home/${me.username}";
in
{
  flake.modules.hjem.matugen = {
    xdg.config.files = {
      "matugen/config.toml".text = ''
        [config]
        expr_prefix = "{{"
        expr_postfix = "}}"

        [templates.kitty]
        input_path = "${home}/.config/matugen/templates/kitty"
        output_path = "${home}/.config/kitty/matugen-colors.conf"
        post_hook = "kill -SIGUSR1 $(pidof kitty) || true"

        [templates.mako]
        input_path = "${home}/.config/matugen/templates/mako"
        output_path = "${home}/.config/mako/config"
        post_hook = "makoctl reload || true"

        [templates.waybar]
        input_path = "${home}/.config/matugen/templates/waybar"
        output_path = "${home}/.config/waybar/matugen-colors.css"
        post_hook = "pkill waybar; sleep 0.3; waybar & disown"

        [templates.fuzzel]
        input_path = "${home}/.config/matugen/templates/fuzzel"
        output_path = "${home}/.config/fuzzel/fuzzel.ini"

        [templates.gtk3]
        input_path = "${home}/.config/matugen/templates/gtk3"
        output_path = "${home}/.config/gtk-3.0/gtk.css"

        [templates.gtk4]
        input_path = "${home}/.config/matugen/templates/gtk4"
        output_path = "${home}/.config/gtk-4.0/gtk.css"

        [templates.swaylock]
        input_path = "${home}/.config/matugen/templates/swaylock"
        output_path = "${home}/.config/swaylock/config"

        [templates.fcitx5]
        input_path = "${home}/.config/matugen/templates/fcitx5"
        output_path = "${home}/.config/fcitx5/themes/matugen.conf"
        post_hook = "fcitx5 -rs || true"
      '';
      "matugen/templates/kitty".source = ./matugen/kitty;
      "matugen/templates/mako".source = ./matugen/mako;
      "matugen/templates/waybar".source = ./matugen/waybar;
      "matugen/templates/fuzzel".source = ./matugen/fuzzel;
      "matugen/templates/gtk3".source = ./matugen/gtk3;
      "matugen/templates/gtk4".source = ./matugen/gtk4;
      "matugen/templates/swaylock".source = ./matugen/swaylock;
      "matugen/templates/fcitx5".source = ./matugen/fcitx5;
    };
  };
}
