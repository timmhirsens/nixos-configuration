{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    arandr
    betterlockscreen
    catppuccin
    clipit
    evince
    flameshot
    gnome.simple-scan
    microsoft-edge
    networkmanager-fortisslvpn
    picom
    rofi
    rofi-power-menu
    slack
    thunderbird
    xdg-user-dirs
    zoom-us
  ];

  services.udiskie = {
    enable = true;
    tray = "always";
  };

  services.picom.enable = true;

  services.betterlockscreen = {
    enable = true;
    arguments = [ "blur" ];
  };

  services.flameshot.enable = true;

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
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
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
