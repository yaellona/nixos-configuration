{ me, pkgs, ... }:

{
  flake.homeManagerModules.waypaper = {

    xdg.configFile."waypaper/config.ini".text =
      #ini
      ''
        [Settings]
        language = en
        backend = awww
        folder = ${../../../assets/waypapers}
        monitors = All
        wallpaper = 
        show_path_in_tooltip = True
        fill = fill
        sort = name
        color = #ffffff
        subfolders = False
        all_subfolders = False
        show_hidden = False
        show_gifs_only = False
        zen_mode = True
        number_of_columns = 3

        swww_transition_type = any
        swww_transition_step = 63
        swww_transition_angle = 0
        swww_transition_duration = 2
        swww_transition_fps = 60
        mpvpaper_sound = False
        mpvpaper_options = 
        use_xdg_state = False
        stylesheet = /home/${me.username}/.config/waypaper/style.css
        keybindings = ~/.config/waypaper/keybindings.ini
      '';
  };
}
