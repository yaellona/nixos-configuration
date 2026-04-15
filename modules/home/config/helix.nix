{
  pkgs,
  lib,
  ...
}:
{
  flake.modules.hjem.helix = {
    xdg.config.files = {
      "helix/config.toml".text =
        #toml
        ''
          theme = "catppuccin_mocha"

          [editor]
          bufferline = "always"
          color-modes = true
          completion-trigger-len = 1
          gutters = ["diff", "diagnostics", "line-numbers", "spacer"]

          [editor.auto-save]
          focus-lost = true

          [editor.auto-save.after-delay]
          enable = true

          [editor.cursor-shape]
          insert = "bar"
          normal = "block"
          select = "underline"

          [editor.file-picker]
          hidden = false
          ignore = false

          [editor.indent-guides]
          character = "┊"
          render = true
          skip-levels = 1

          [editor.lsp]
          display-inlay-hints = true
          display-messages = true

          [editor.statusline]
          center = ["file-name"]
          left = ["mode", "spinner"]
          right = [
              "diagnostics",
              "selections",
              "position",
              "file-encoding",
              "file-line-ending",
              "file-type",
          ]
          separator = "|"
        '';

      "helix/languages.toml".text = ''
        [[language]]
        auto-format = true
        language-servers = ["nixd"]
        name = "nix"

        [language.formatter]
        command = "${lib.getExe pkgs.nixfmt}"

        [[language]]
        auto-format = true
        language-servers = ["clangd"]
        name = "c"

        [language.formatter]
        command = "${pkgs.clang-tools}/bin/clang-format"

        [[language]]
        auto-format = true
        language-servers = ["clangd"]
        name = "cpp"

        [language.formatter]
        command = "${pkgs.clang-tools}/bin/clang-format"

        [[language]]
        auto-format = true
        language-servers = ["pyright"]
        name = "python"

        [language.formatter]
        args = ["format", "-"]
        command = "${lib.getExe pkgs.ruff}"

        [[language]]
        auto-format = true
        language-servers = ["rust-analyzer"]
        name = "rust"

        [language.formatter]
        command = "${pkgs.rustfmt}/bin/rustfmt"

        [[language]]
        auto-format = true
        language-servers = ["gopls"]
        name = "go"

        [language.formatter]
        command = "${pkgs.go}/bin/gofmt"

        [[language]]
        auto-format = true
        language-servers = ["typescript-language-server"]
        name = "javascript"

        [[language]]
        language-servers = ["vuels"]
        name = "vue"

        [[language]]
        auto-format = true
        language-servers = ["qmlls"]
        name = "qml"

        [language.formatter]
        args = ["-"]
        command = "${pkgs.qt6.qtdeclarative}/bin/qmlformat"

        [[language]]
        auto-format = true
        language-servers = ["docker-langserver"]
        name = "dockerfile"

        [[language]]
        language-servers = ["docker-compose-langserver"]
        name = "docker-compose"

        [[language]]
        auto-format = true
        language-servers = ["vscode-json-languageserver"]
        name = "json"

        [[language]]
        auto-format = true
        language-servers = ["vscode-json-languageserver"]
        name = "jsonc"

        [[language]]
        auto-format = true
        name = "kdl"

        [language.formatter]
        args = ["format", "-"]
        command = "${lib.getExe pkgs.kdlfmt}"

        [[language]]
        language-servers = ["yaml-language-server"]
        name = "yaml"

        [language-server.clangd]
        command = "${pkgs.clang-tools}/bin/clangd"

        [language-server.docker-compose-langserver]
        command = "${lib.getExe pkgs.docker-compose-language-service}"

        [language-server.docker-langserver]
        command = "${lib.getExe pkgs.dockerfile-language-server}"

        [language-server.gopls]
        command = "${lib.getExe pkgs.gopls}"

        [language-server.markman]
        command = "${lib.getExe pkgs.marksman}"

        [language-server.nixd]
        command = "${lib.getExe pkgs.nixd}"

        [language-server.pyright]
        args = ["--stdio"]
        command = "${pkgs.pyright}/bin/pyright-langserver"

        [language-server.qmlls]
        command = "${pkgs.qt6.qtdeclarative}/bin/qmlls"

        [language-server.rust-analyzer]
        command = "${lib.getExe pkgs.rust-analyzer}"

        [language-server.tailwindcss-language-server]
        command = "${lib.getExe pkgs.tailwindcss-language-server}"

        [language-server.typescript-language-server]
        command = "${lib.getExe pkgs.typescript-language-server}"

        [language-server.vuels]
        args = ["--stdio"]
        command = "${lib.getExe pkgs.vue-language-server}"

        [language-server.vscode-json-languageserver]
        command = "${lib.getExe pkgs.vscode-json-languageserver}"

        [language-server.yaml-language-server]
        command = "${lib.getExe pkgs.yaml-language-server}"
      '';
    };
  };
}
