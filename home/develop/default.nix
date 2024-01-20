{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    neovim
    temurin-bin-21
    qmk
    nodejs_20
    nodePackages.pnpm
    maven
  ];

  programs = {
    vscode.enable = true;
  };
}
