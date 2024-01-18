{ config, pkgs, ... }:

{
  imports = [
    ./home/alacritty
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

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    ## Dev
    neovim
    temurin-bin-21
    slack
    python3
    python311Packages.pip
    qmk
    udiskie
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

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders;
      name = "Papirus-Dark";
    };
    cursorTheme = {
      package = pkgs.catppuccin-cursors.macchiatoLight;
      name = "Catppuccin-Macchiato-Light2-Cursors";
    };
    font = {
      package = pkgs.noto-fonts;
      name = "Noto Sans Regular";
      size = 10;
    };
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "macchiato";
      };
    };
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
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#c6a0f6";
        separator_color = "frame";
        frame_width = 2;
        transparency = 10;
        gap_size = 4;
      };
      urgency_low = {
        background = "#24273A";
        foreground = "#CAD3F5";
      };
      urgency_normal = {
        background = "#24273A";
        foreground = "#CAD3F5";
      };
      urgency_critical = {
        background = "#24273A";
        foreground = "#CAD3F5";
        frame_color = "#F5A97F";
      };
    };
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

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
