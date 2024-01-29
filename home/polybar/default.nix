{ pkgs, lib, ... }: {
  xdg.configFile."polybar-scripts" = {
    enable = false;
    executable = true;
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "polybar";
      repo = "polybar-scripts";
      rev = "master";
      sparseCheckout = [
        "polybar-scripts/system-cpu-frequency/system-cpu-frequency.sh"
      ];
      sha256 = "sha256-bhuS2SQYP2KvwkOwfdjGLlismmNyDiViOOkIbVJPR+c=";
    };
  };


  services.polybar = {
    enable = true;
    script = "polybar top &";
    package = pkgs.polybarFull;
    extraConfig = ''
      [colors]
      base = #24273a
      mantle = #1e2030
      crust = #181926

      text = #cad3f5
      subtext0 = #a5adcb
      subtext1 = #b8c0e0

      surface0 = #363a4f
      surface1 = #494d64
      surface2 = #5b6078

      overlay0 = #6e738d
      overlay1 = #8087a2
      overlay2 = #939ab7


      blue = #8aadf4
      lavender = #b7bdf8
      sapphire = #7dc4e4
      sky = #91d7e3
      teal = #8bd5ca
      green = #a6da95
      yellow = #eed49f
      peach = #f5a97f
      maroon = #ee99a0
      red = #ed8796
      mauve = #c6a0f6
      pink = #f5bde6
      flamingo = #f0c6c6
      rosewater = #f4dbd6

      transparent = #FF00000

      background = ''${colors.base}
      background-alt = ''${colors.mantle}
      foreground = ''${colors.text}
      foreground-alt = ''${colors.subtext0}
      primary = ''${colors.mauve}
      secondary = ''${colors.blue}
      alert = ''${colors.red}

      darkblue = ''${colors.sapphire}
      lightgray = ''${colors.overlay2}
      lightblueishgray = ''${colors.overlay1}
      white = ''${colors.text}
      orange = ''${colors.peach}
      # yellow = #e5c07b
      # green = #98c379
      cyan = ''${colors.sky}
      # blue = #61afef
      magenta = ''${colors.teal}
      darkred = ''${colors.maroon}


      [bar/top]
      ;monitor = ''${env:MONITOR:HDMI-1}
      width = 100%
      height = 25
      ;offset-x = 1%
      ;offset-y = 1%
      radius = 0.0
      fixed-center = false

      background = ''${colors.background}
      foreground = ''${colors.foreground}

      line-size = 1
      line-color = #f00

      border-bottom-size = 0
      border-top-size = 0
      border-right-size = 0
      border-left-size = 0
      border-color = #00000000

      padding-left = 0
      padding-right = 2

      module-margin-left = 1
      module-margin-right = 2

      font-0 = JetBrains Mono:pixelsize=9;1
      font-1 = Font Awesome 6 Free Solid:size=9:1 
      font-2 = Font Awesome 6 Free:size=9:1
      font-3 = Font Awesome 6 Brands:size=9:1

      modules-left = i3 xwindow
      modules-center = 
      modules-right = pulseaudio xkeyboard memory cpu wlan eth battery temperature date

      tray-position = right
      tray-padding = 2
      ;tray-background = #0063ff

      wm-restack = i3

      ;override-redirect = true

      ;scroll-up = bspwm-desknext
      ;scroll-down = bspwm-deskprev

      ;scroll-up = i3wm-wsnext
      ;scroll-down = i3wm-wsprev

      cursor-click = pointer
      cursor-scroll = ns-resize

      enable-ipc = true

      [module/xwindow]
      type = internal/xwindow
      label = %title:0:120:...%

      [module/xkeyboard]
      type = internal/xkeyboard
      blacklist-0 = num lock

      format-prefix = " "
      format-prefix-foreground = ''${colors.foreground-alt}
      format-prefix-underline = ''${colors.secondary}

      label-layout = %layout%
      label-layout-underline = ''${colors.secondary}

      label-indicator-padding = 2
      label-indicator-margin = 1
      label-indicator-background = ''${colors.secondary}
      label-indicator-underline = ''${colors.secondary}

      [module/filesystem]
      type = internal/fs
      interval = 25

      mount-0 = /
      format-prefix = " "
      label-mounted = %{F#0a81f5}%mountpoint%%{F-}: %percentage_used%%
      label-unmounted = %mountpoint% not mounted
      label-unmounted-foreground = ''${colors.foreground-alt}

      [module/i3]
      type = internal/i3
      format = <label-state> <label-mode>
      index-sort = true
      wrapping-scroll = false

      ; Only show workspaces on the same output as the bar
      ;pin-workspaces = true

      label-mode-padding = 1
      label-mode-foreground = #000
      label-mode-background = ''${colors.primary}

      ; focused = Active workspace on focused monitor
      label-focused = %name% %icon% 
      label-focused-background = ''${colors.background-alt}
      label-focused-underline= ''${colors.primary}
      label-focused-padding = 1

      ; unfocused = Inactive workspace on any monitor
      label-unfocused = %name% %icon%
      label-unfocused-padding = 1

      ; visible = Active workspace on unfocused monitor
      label-visible = %name% %icon%
      label-visible-background = ''${self.label-focused-background}
      label-visible-underline = ''${self.label-focused-underline}
      label-visible-padding = ''${self.label-focused-padding}

      ; urgent = Workspace with urgency hint set
      label-urgent = %name% %icon%
      label-urgent-background = ''${colors.alert}
      label-urgent-padding = 1

      ; Separator in between workspaces
      ; label-separator = |
      ws-icon-0 = "1;"
      ws-icon-1 = "2;"
      ws-icon-2 = 3;
      ws-icon-3 = 4;
      ws-icon-4 = 5;
      ws-icon-5 = 6;
      ws-icon-6 = 7;
      ws-icon-7 = 8;
      ws-icon-8 = 9;
      ws-icon-9 = 10;
      ws-icon-default = 

      [module/mpd]
      type = internal/mpd
      format-online = <label-song>  <icon-prev> <icon-stop> <toggle> <icon-next>

      icon-prev = 
      icon-stop = 
      icon-play = 
      icon-pause = 
      icon-next = 

      label-song-maxlen = 25
      label-song-ellipsis = true

      [module/xbacklight]
      type = internal/xbacklight

      format = <label> <bar>
      label = BL

      bar-width = 10
      bar-indicator = |
      bar-indicator-foreground = #fff
      bar-indicator-font = 2
      bar-fill = ─
      bar-fill-font = 2
      bar-fill-foreground = #9f78e1
      bar-empty = ─
      bar-empty-font = 2
      bar-empty-foreground = ''${colors.foreground-alt}

      [module/backlight-acpi]
      inherit = module/xbacklight
      type = internal/backlight
      card = intel_backlight

      [module/cpu]
      type = internal/cpu
      interval = 2
      format-prefix = " "
      format-prefix-foreground = ''${colors.foreground-alt}
      format-underline = ''${colors.darkred}
      label = %percentage:2%%

      [module/memory]
      type = internal/memory
      interval = 2
      format-prefix = " "
      format-prefix-foreground = ''${colors.foreground-alt}
      format-underline = #4bffdc
      label = %gb_used%

      [module/wlan]
      type = internal/network
      interface = wlp2s0
      interval = 3.0

      format-connected-prefix = " "
      format-connected-prefix-foreground = ''${colors.foreground-alt}
      format-connected = <label-connected>
      format-connected-underline = ''${colors.yellow}
      label-connected = %essid%

      format-disconnected =
      ;format-disconnected = <label-disconnected>
      ;format-disconnected-underline = ''${self.format-connected-underline}
      ;label-disconnected = %ifname% disconnected
      ;label-disconnected-foreground = ''${colors.foreground-alt}

      ramp-signal-foreground = ''${colors.foreground-alt}

      [module/eth]
      type = internal/network
      interface = enp1s0f1
      interval = 3.0

      format-connected-underline = #55aa55
      format-connected-prefix = " "
      format-connected-prefix-foreground = ''${colors.foreground-alt}
      label-connected = %local_ip%

      format-disconnected =
      ;format-disconnected = <label-disconnected>
      ;format-disconnected-underline = ''${self.format-connected-underline}
      ;label-disconnected = %ifname% disconnected
      ;label-disconnected-foreground = ''${colors.foreground-alt}

      [module/date]
      type = internal/date
      interval = 5

      date = " %d.%m.%Y"
      date-alt = " %Y-%m-%d"

      time = %H:%M
      time-alt = %H:%M:%S

      format-prefix =  
      format-prefix-foreground = ''${colors.foreground-alt}
      format-underline = ''${colors.blue}

      label = %date% %time%

      ;hidden = true

      [module/pulseaudio]
      type = internal/pulseaudio

      format-volume = <label-volume>
      label-volume =  %percentage%%
      label-volume-foreground = ''${root.foreground}

      label-muted =  muted
      label-muted-foreground = #666

      [module/battery]
      type = internal/battery
      battery = BAT0
      adapter = AC
      full-at = 98

      format-charging = <animation-charging> <label-charging>
      format-charging-underline = ''${colors.green}

      format-discharging = <ramp-capacity> <label-discharging>
      format-discharging-underline = ''${self.format-charging-underline}

      format-full-prefix = " "
      format-full-prefix-foreground = ''${colors.foreground-alt}
      format-full-underline = ''${self.format-charging-underline}

      ramp-capacity-0 = 
      ramp-capacity-1 =  
      ramp-capacity-2 =  
      ramp-capacity-foreground = ''${colors.foreground-alt}

      animation-charging-0 =  
      animation-charging-1 =  
      animation-charging-2 = 
      animation-charging-3 =  
      animation-charging-4 =  
      animation-charging-foreground = ''${colors.foreground-alt}
      animation-charging-framerate = 750

      [module/temperature]
      type = internal/temperature
      thermal-zone = 0
      warn-temperature = 60

      format = <ramp> <label>
      format-underline = ''${colors.lightblueishgray}
      format-warn = <ramp> <label-warn>
      format-warn-underline = ''${self.format-underline}

      label = %temperature-c%
      label-warn = %temperature-c%
      label-warn-foreground = ''${colors.alert}

      ramp-0 = 
      ramp-1 = 
      ramp-2 = 
      ramp-3 = 
      ramp-4 = 
      ramp-foreground = ''${colors.foreground-alt}

      [settings]
      screenchange-reload = true
      ;compositing-background = xor
      ;compositing-background = screen
      ;compositing-foreground = source
      ;compositing-border = over
      ;pseudo-transparency = false

      [global/wm]
      margin-top = 0
      margin-bottom = 0

      [module/system-cpu-frequency]
      type = custom/script
      exec = ~/.config/polybar-scripts/polybar-scripts/system-cpu-frequency/system-cpu-frequency.sh
      interval = 10

      ; vim:ft=dosini
    '';
  };

}
