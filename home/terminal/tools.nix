{ pkgs, ... }: {
  home.packages = with pkgs; [
    curl
    eza
    jq
    tldr
    unzip
    wget
    zip
    cmatrix
    btop
  ];
  programs = {
    feh.enable = true;
    bat.enable = true;
  };
}
