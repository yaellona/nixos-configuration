{
  flake.homeManagerModules.zed = {
    imports = [
      ./_settings
    ];
    programs.zed-editor = {
      enable = true;
      installRemoteServer = true;
      mutableUserSettings = false;
      mutableUserTasks = false;
      extensions = [
        "Catppuccin Icons"
        "dockerfile"
        "git-firefly"
        "HTML"
        "log"
        "kdl"
        "Make"
        "nix"
        "Vue"
        "csharp"
        "todotxt"
        "opencode"
      ];
    };
  };
}
