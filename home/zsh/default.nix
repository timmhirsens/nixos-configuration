{ pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      initExtra = ''
        	pfetch
      '';
      shellAliases = {
        ll = "eza -l";
        la = "eza -la";
        ls = "eza";
        ".." = "cd ..";
        g = "git";
        k = "kubectl";
      };
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
