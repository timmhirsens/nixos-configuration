{ pkgs, ... }: {
  home.packages = with pkgs; [ git-absorb git-extras git-town ];

  programs.git = {
    enable = true;
    delta.enable = true;
    delta.package = pkgs.git-extras;

    userName = "Timm Hirsens";
    userEmail = "timmhirsens@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = "true";
      pull.rebase = "true";
      core.autocrlf = "input";
    };

    aliases = {
      append = "town append";
      diff-parent = "town diff-parent";
      hack = "town hack";
      kill = "town kill";
      new-pull-request = "town new-pull-request";
      prepend = "town prepend";
      prune-branches = "town prune-branches";
      rename-branch = "town rename-branch";
      repo = "town repo";
      ship = "town ship";
      sync = "town sync";
      s = "town switch";
    };

    ignores = [
      ## IntelliJ stuff
      ".idea"
      "*.iml"
      "out/"

      ## Mac OS stuff
      ".DS_Store"
    ];
  };
}
