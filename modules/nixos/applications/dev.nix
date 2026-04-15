{ pkgs, ... }:
{
  flake.modules.nixos.dev = {
    environment.systemPackages = with pkgs; [
      gcc
      cmake
      gnumake
      go
      nodejs
      # rustup
      rustc
      cargo

      jdk21
      hexo-cli
      distrobox
      distrobox-tui
    ];

    environment.variables = {
      RUSTUP_DIST_SERVER = "https://mirrors.ustc.edu.cn/rust-static";
      RUSTUP_UPDATE_ROOT = "https://mirrors.ustc.edu.cn/rust-static/rustup";
      GOPROXY = "https://goproxy.cn,direct";
      GOSUMDB = "off";
    };
  };
}
