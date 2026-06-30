{
  config,
  ...
}:
{
  config.flake.hosts.${config.me.hostname} = {
    modules = [ ./_hardware-configuration.nix ];
  };
}
