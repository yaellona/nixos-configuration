{ pkgs, ... }:

{
  flake.modules.nixos.swayidle = {
    systemd.user.services.swayidle = {
      description = "Sway idle daemon";
      wantedBy = [ "graphical-session.target" ];
      serviceConfig.Type = "simple";
      serviceConfig.ExecStart = "${pkgs.swayidle}/bin/swayidle -w timeout 560 '${pkgs.libnotify}/bin/notify-send 锁屏提醒 1分钟后进入锁屏' timeout 600 '${pkgs.swaylock-effects}/bin/swaylock' before-sleep '${pkgs.swaylock-effects}/bin/swaylock'";
      serviceConfig.Restart = "on-failure";
    };
  };
}
