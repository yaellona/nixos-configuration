{
  config,
  ...
}:
{
  config.flake.hosts.${config.me.hostname} = {
    modules = [ ../_hardware/itx.nix ];
  };
}
