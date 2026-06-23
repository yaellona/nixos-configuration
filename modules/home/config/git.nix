{ ... }:
{
  flake.homeManagerModules.git = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "yaellona";
          email = "2753739819@qq.com";
        };
      };
    };
  };
}
