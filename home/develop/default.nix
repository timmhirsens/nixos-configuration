{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    k9s
    kubectl
    maven
    neovim
    nodejs_20
    nodePackages.pnpm
    terraform
    qmk
    temurin-bin-21
  ];

  programs = {
    vscode.enable = true;
  };
}
