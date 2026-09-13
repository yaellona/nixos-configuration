{ ... }:
{
  programs.nixvim.plugins = {

    lualine.enable = true; # 状态栏
    luasnip.enable = true; # 代码片段
    web-devicons.enable = true; # 文件图标

    # scrollview.enable = true;
    # cursorline.enable = true;
    # cursorline.settings.cursorword.enable = true;
    fidget.enable = true;
    indent-blankline = {
      enable = true;
      settings = {
        indent.char = "│";
        scope = {
          show_end = false;
          show_exact_scope = true;
          show_start = false;
        };
        exclude = {
          buftypes = [ "terminal" "quickfix" ];
          filetypes = [ "" "checkhealth" "help" "lspinfo" "TelescopePrompt" "TelescopeResults" ];
        };
      };
    };
    todo-comments = {
      enable = true;
      keymaps = {
        todoTelescope = {
          key = "<leader>ft";
          mode = "n";
          options.desc = "Todo Telescope";
        };
        todoQuickFix = {
          key = "<leader>ftq";
          mode = "n";
          options.desc = "Todo QuickFix";
        };
      };
    };
    noice.enable = true;

    # navbuddy.enable = true;
    # smartcolumn.enable = true;
    # fastaction.enable = true;
    # colorizer = {
    #   enable = true;
    #   settings.user_default_options = {
    #     mode = "virtualtext";
    #     css = true;
    #     css_fn = true;
    #     names = false;
    #     virtualtext = "■";
    #     virtualtext_inline = true;
    #     virtualtext_mode = "foreground";
    #   };
    # };
  };
}
