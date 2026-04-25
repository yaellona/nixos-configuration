{ pkgs, ... }:
{
  flake.homeManagerModules.env = {
    home.packages = with pkgs; [
      hexo-cli
      gcc
      cmake
      gnumake
      go
      nodejs
      rustup
      dotnet-sdk_10
      godot
      (prismlauncher.override {
        jdks = [
          pkgs.javaPackages.compiler.temurin-bin.jre-8
          pkgs.javaPackages.compiler.temurin-bin.jre-17
          pkgs.javaPackages.compiler.temurin-bin.jre-21
          pkgs.javaPackages.compiler.temurin-bin.jre-25
        ];
      })
    ];
    home.sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";

      RUSTUP_DIST_SERVER = "https://mirrors.ustc.edu.cn/rust-static";
      RUSTUP_UPDATE_ROOT = "https://mirrors.ustc.edu.cn/rust-static/rustup";

      GOPROXY = "https://goproxy.cn,direct";
      GOSUMDB = "off";
    };
  };
}
