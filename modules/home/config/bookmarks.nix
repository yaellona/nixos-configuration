{ me, ... }:
{
  flake.homeManagerModules.bookmarks = {
    xdg.configFile."gtk-3.0/bookmarks".text =
      "
file:///home/${me.username}/Documents Documents
file:///home/${me.username}/Pictures Pictures
file:///home/${me.username}/Videos Videos
file:///home/${me.username}/Music Music
file:///home/${me.username}/Downloads Downloads
file:///home/${me.username}/.config .config
file:///home/${me.username}/.local
      ";
  };
}
