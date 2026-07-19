{ pkgs, ... }:
{
  flake.modules.nixos.cli = {
    environment.systemPackages = with pkgs; [
      wget
      git
      zip
      unzip
      unrar
      ffmpeg
      dust
      mihomo
    ];

    security.wrappers.mihomo = {
      source = "${pkgs.mihomo}/bin/mihomo";
      capabilities = "cap_net_admin,cap_net_bind_service,cap_net_raw+eip";
      owner = "root";
      group = "users";
      permissions = "u+rx,g+rx";
    };
  };
}
