{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    azure-cli
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

    k9s = {
      enable = true;
      settings = {
        k9s = {
          ui.skin = "catppuccin-macchiato";
        };
      };
    };
  };

  xdg.configFile."k9s/skins/catppuccin-macchiato.yaml" = {
    enable = true;
    source = pkgs.fetchurl {
      url = https://raw.githubusercontent.com/catppuccin/k9s/main/dist/catppuccin-macchiato.yaml;
      hash = "sha256-OR23zFdI/aQBL4cdqN/cnawEASRGw0voBP93QLzivfE=";
    };
  };

}
