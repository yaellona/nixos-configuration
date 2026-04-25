{
  config,
  me,
  ...
}:
let
  photoViewer = "org.gnome.gThumb.desktop";
  # photoViewer = "swayimg.desktop";
  # pdfViewer = "org.kde.okular.desktop";
  pdfViewer = "org.gnome.Evince.desktop";
  zipViewer = "org.gnome.FileRoller.desktop";
  textEditor = "kitty-nvim.desktop";
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
          "image/png" = [ photoViewer ];
          "image/jpeg" = [ photoViewer ];
          "image/gif" = [ photoViewer ];
          "image/bmp" = [ photoViewer ];
          "image/tiff" = [ photoViewer ];
          "image/webp" = [ photoViewer ];
          "image/svg+xml" = [ photoViewer ];
          "image/heic" = [ photoViewer ];
          "image/avif" = [ photoViewer ];
          "application/pdf" = [ pdfViewer ];

          "application/zip" = [ zipViewer ];
          "application/vnd.rar" = [ zipViewer ];
          "application/x-rar-compressed" = [ zipViewer ];
          "application/x-7z-compressed" = [ zipViewer ];
          "application/gzip" = [ zipViewer ];
          "application/x-xz" = [ zipViewer ];
          "application/x-tar" = [ zipViewer ];

          "text/plain" = [ textEditor ];
          "text/html" = [ textEditor ];
          "text/css" = [ textEditor ];
          "text/javascript" = [ textEditor ];
          "text/xml" = [ textEditor ];
          "text/markdown" = [ textEditor ];
          "text/csv" = [ textEditor ];
          "text/x-shellscript" = [ textEditor ];
          "text/yaml" = [ textEditor ];
          "text/x-nix" = [ textEditor ];
          "text/x-python" = [ textEditor ];
          "text/x-c" = [ textEditor ];
          "text/x-c++" = [ textEditor ];
          "text/x-java" = [ textEditor ];
          "text/x-rust" = [ textEditor ];
          "text/x-go" = [ textEditor ];
          "text/x-toml" = [ textEditor ];
          "text/x-diff" = [ textEditor ];
          "application/json" = [ textEditor ];
          "application/xml" = [ textEditor ];
          "application/x-yaml" = [ textEditor ];
          "application/x-shellscript" = [ textEditor ];
          "application/x-desktop" = [ textEditor ];
        };
      };
    };

    xdg.dataFile."applications/${textEditor}".text = ''
      [Desktop Entry]
      Type=Application
      Name=Neovim in Kitty
      Exec=kitty -e nvim %F
      Terminal=false
      Categories=TextEditor;
      MimeType=text/plain;text/html;text/css;text/javascript;text/xml;text/markdown;text/csv;text/x-shellscript;text/yaml;text/x-nix;text/x-python;text/x-c;text/x-c++;text/x-java;text/x-rust;text/x-go;text/x-toml;text/x-diff;application/json;application/xml;application/x-yaml;application/x-shellscript;application/x-desktop;
    '';
  };
}
