{ pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      initExtra = ''
          bindkey -e
          bindkey -M emacs "''${terminfo[khome]}" beginning-of-line
          bindkey -M emacs "''${terminfo[kend]}"  end-of-line
          bindkey -M emacs '^[[3;5~' kill-word
          bindkey -M emacs '^H' backward-kill-word
          bindkey -M emacs '^[[1;5C' forward-word
          bindkey -M emacs '^[[1;5D' backward-word
          bindkey '^r' history-incremental-search-backward
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
