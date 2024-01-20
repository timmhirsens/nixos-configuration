{ config, pkgs, ... }:

{
  imports = [
    ./home/alacritty
    ./home/desktop
    ./home/develop
    ./home/git
    ./home/i3
    ./home/intellij
    ./home/polybar
    ./home/terminal
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "timm";
  home.homeDirectory = "/home/timm";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    ## Tools
    via
    vial
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

  nixpkgs.config.allowUnfree = true;


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
