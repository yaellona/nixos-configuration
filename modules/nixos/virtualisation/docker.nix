{ pkgs, ... }:
{
  flake.modules.nixos.docker = {
    virtualisation.docker = {
      enable = true;
      daemon.settings = {
        registry-mirrors = [
          "https://docker.1ms.run"
          "https://docker.xuanyuan.me"
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      docker-compose
      lazydocker
    ];
  };
}
