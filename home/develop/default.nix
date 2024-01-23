{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    kubectl
    maven
    temurin-bin-21
    neovim
    nodejs_20
    nodePackages.pnpm
    qmk
  ];

  programs = {
    vscode.enable = true;
  };
}
