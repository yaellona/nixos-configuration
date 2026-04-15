{ me, ... }:
{
  flake.modules.hjem.userDirs = {
    xdg.config.files = {
      "user-dirs.dirs" = {
        text = ''
          XDG_DESKTOP_DIR="/home/${me.username}/Desktop"
          XDG_DOCUMENTS_DIR="/home/${me.username}/Documents"
          XDG_DOWNLOAD_DIR="/home/${me.username}/Downloads"
          XDG_MUSIC_DIR="/home/${me.username}/Music"
          XDG_PICTURES_DIR="/home/${me.username}/Pictures"
          XDG_PUBLICSHARE_DIR="/home/${me.username}/Public"
          XDG_TEMPLATES_DIR="/home/${me.username}/Templates"
          XDG_VIDEOS_DIR="/home/${me.username}/Videos"
        '';
      };
      "user-dirs.locale" = {
        text = "en_US";
      };
    };
  };
}
