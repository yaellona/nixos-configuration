{
  flake.modules.homeManager.quickshell =
    {
      inputs,
      assets,
      ...
    }:
    {
      imports = [
        inputs.yaellona-quickshell.homeModules.default
      ];

      # quickshell 本体（配置由下面的 yaellona-quickshell 模块安装到
      # ~/.config/quickshell，default 配置）
      programs.quickshell.enable = true;

      programs.yaellona-quickshell = {
        enable = true;

        # 自启动：yaellona-quickshell.service（systemd user，Restart=on-failure）
        systemd.enable = true;

        # 主题颜色/字体默认跟随 stylix；壁纸目录与旧 noctalia 保持一致
        theme.wallpaperDir = "${assets}/waypapers";
      };
    };
}
