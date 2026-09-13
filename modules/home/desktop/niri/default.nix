{
  flake.homeManagerModules.niri-flake =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    let
      binds = import ./_binds.nix { inherit pkgs lib; };
      startup = import ./_startup.nix { inherit pkgs lib; };
      settings = import ./_settings.nix { inherit pkgs lib config; };
      rules = import ./_rules.nix { inherit config; };
      output = import ./_output.nix { };
    in
    {
      xdg.configFile."niri/config.kdl".text =
        #kdl
        ''
          ${output}
          ${settings}
          ${startup}
          ${binds}
          ${rules}
        '';
    };
}
