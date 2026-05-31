{
  # config,
  me,
  ...
}:
let
  photoViewer = "org.gnome.gThumb.desktop";
  # photoViewer = "swayimg.desktop";
  # pdfViewer = "org.kde.okular.desktop";
  pdfViewer = "org.gnome.Evince.desktop";
  zipViewer = "org.gnome.FileRoller.desktop";
  textEditor = "helix.desktop";
in
{
  flake.homeManagerModules.xdg = {
    xdg = {
      enable = true;
      userDirs = {
        enable = true;
        # 设置各个用户目录的路径
        desktop = "/home/${me.username}/Desktop";
        documents = "/home/${me.username}/Documents";
        download = "/home/${me.username}/Downloads";
        music = "/home/${me.username}/Music";
        pictures = "/home/${me.username}/Pictures";
        publicShare = "/home/${me.username}/Public";
        templates = "/home/${me.username}/Templates";
        videos = "/home/${me.username}/Videos";
      };
      mimeApps = {
        enable = true;
        defaultApplications = {
          "x-scheme-handler/terminal" = "kitty.desktop";
          "image/*" = [ photoViewer ];
          "application/pdf" = [ pdfViewer ];

          "application/zip" = [ zipViewer ];
          "application/vnd.rar" = [ zipViewer ];
          "application/x-rar-compressed" = [ zipViewer ];
          "application/x-7z-compressed" = [ zipViewer ];
          "application/gzip" = [ zipViewer ];
          "application/x-xz" = [ zipViewer ];
          "application/x-tar" = [ zipViewer ];

          "text/*" = [ textEditor ];
          "application/json" = [ textEditor ];
          "application/xml" = [ textEditor ];
          "application/x-yaml" = [ textEditor ];
          "application/x-shellscript" = [ textEditor ];
          "application/x-desktop" = [ textEditor ];
        };
      };
    };
  };
}
