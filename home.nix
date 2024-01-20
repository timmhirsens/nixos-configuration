{ config, pkgs, ... }:

{
  imports = [
    ./home/alacritty
    ./home/desktop
    ./home/git
    ./home/i3
    ./home/intellij
    ./home/polybar
    ./home/zsh
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "timm";
  home.homeDirectory = "/home/timm";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    ## Tools
    curl
    eza
    jq
    tldr
    unzip
    wget
    zip
    cmatrix
    btop
    via
    vial
    ## Dev
    neovim
    temurin-bin-21
    slack
    python3
    python311Packages.pip
    qmk
    udiskie
    nodejs_20
    nodePackages.pnpm
    maven
    ## Desktop
    betterlockscreen
    picom
    thunderbird
    flameshot
    rofi
    rofi-power-menu
    catppuccin
    xdg-user-dirs
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  programs = {
    vscode.enable = true;
    feh.enable = true;
    bat.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  services.picom.enable = true;
  services.betterlockscreen = {
    enable = true;
    arguments = [ "blur" ];
  };

  services.udiskie = {
    enable = true;
    tray = "always";
  };
  services.flameshot.enable = true;

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
