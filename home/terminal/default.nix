{ pkgs, ... }: {
  imports = [
    ./tmux.nix
    ./tools.nix
    ./zsh.nix
  ];
}
