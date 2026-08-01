{ pkgs, ... }:
{
  flake.modules.nixos.clash = {
    environment.systemPackages = with pkgs; [
      flclash
      mihomo
    ];

    security.wrappers.flclash = {
      source = "${pkgs.flclash}/bin/FlClashCore";
      capabilities = "cap_net_admin,cap_net_bind_service,cap_net_raw+eip";
      owner = "root";
      group = "users";
      permissions = "u+rx,g+rx";
    };
    security.wrappers.mihomo = {
      source = "${pkgs.mihomo}/bin/mihomo";
      capabilities = "cap_net_admin,cap_net_bind_service,cap_net_raw+eip";
      owner = "root";
      group = "users";
      permissions = "u+rx,g+rx";
    };
    # programs.clash-verge = {
    #   enable = true;
    #   package = pkgs.clash-verge-rev;
    #   # package = pkgs.flclash;
    #   tunMode = true;
    #   serviceMode = true;
    # };
    # networking.proxy.default = "http://127.0.0.1:7897";

    # networking.firewall.trustedInterfaces = [ "mihomo" ];
  };
}
