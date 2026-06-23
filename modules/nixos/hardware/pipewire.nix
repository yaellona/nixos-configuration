{ ... }:
{
  flake.modules.nixos.pipewire = {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.extraConfig."99-hecate-a5-volume" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              {
                "api.alsa.card.name" = "HECATE A5 GAMING HEADSET";
              }
            ];
            actions = {
              update-props = {
                "device.routes.default-sink-volume" = 1.0;
              };
            };
          }
        ];
      };
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };
}
