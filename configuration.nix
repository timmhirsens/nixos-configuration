# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 12;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = false;
  boot.plymouth.theme = "breeze";

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  # networking.useDHCP = true;
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = true;
    };

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };
  };
  nixpkgs.config.allowUnfree = true;


  # Configure keymap in X11
  services.xserver.xkb.layout = "eu,us,de";
  services.xserver.xkb.options = "caps:escape";
  # services.xserver.xkb.variant = ",intl,";

  security.polkit.enable = true;
  security.pam.services.kwallet.enableKwallet = true;
  systemd = {
    user.services.lxpolkit = {
      description = "lxpolkit";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.lxsession}/bin/lxpolkit";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  hardware.sane.extraBackends = [ pkgs.sane-airscan ];
  hardware.sane.enable = true;

  services.blueman.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.udisks2.enable = true;

  services.tlp.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.timm = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "scanner" "lp" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      tree
      alacritty
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [
    dunst
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    docker
    wget
    pfetch
    lxsession
    catppuccin-gtk
    catppuccin-cursors
    catppuccin-papirus-folders
    lxappearance
    plymouth
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.zsh = {
    enable = true;
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "timm" ];
  };
  programs.xss-lock = {
    enable = true;
  };
  programs.nm-applet.enable = true;
  programs.dconf.enable = true;

  virtualisation.docker = {
    enable = true;
  };

  fonts.packages = with pkgs; [
    nerdfix
    noto-fonts
    font-awesome
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  system.stateVersion = "23.11"; # Did you read the comment?

}
