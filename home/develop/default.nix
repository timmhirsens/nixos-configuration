{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    k9s
    kubectl
    maven
    neovim
    nodejs_20
    nodePackages.pnpm
    qmk
    temurin-bin-21
    terraform
    terragrunt
  ];

  programs = {
    vscode.enable = true;
  };
}
