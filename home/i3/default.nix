{ config, pkgs, lib, ... }: {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      bars = [ ];

      colors =
        let
          rosewater = "#f4dbd6";
          flamingo = "#f0c6c6";
          pink = "#f5bde6";
          mauve = "#c6a0f6";
          red = "#ed8796";
          maroon = "#ee99a0";
          peach = "#f5a97f";
          green = "#a6da95";
          teal = "#8bd5ca";
          sky = "#91d7e3";
          sapphire = "#7dc4e4";
          blue = "#8aadf4";
          lavender = "#b7bdf8";
          text = "#cad3f5";
          subtext1 = "#b8c0e0";
          subtext0 = "#a5adcb";
          overlay2 = "#939ab7";
          overlay1 = "#8087a2";
          overlay0 = "#6e738d";
          surface2 = "#5b6078";
          surface1 = "#494d64";
          surface0 = "#363a4f";
          base = "#24273a";
          mantle = "#1e2030";
          crust = "#181926";
        in
        {
          background = base;
          focused = {
            background = base;
            border = pink;
            childBorder = pink;
            indicator = rosewater;
            text = text;
          };
          focusedInactive = {
            background = base;
            border = mauve;
            childBorder = mauve;
            indicator = rosewater;
            text = text;
          };
          unfocused = {
            background = base;
            border = mauve;
            childBorder = mauve;
            indicator = rosewater;
            text = text;
          };
          urgent = {
            background = base;
            border = peach;
            childBorder = peach;
            indicator = overlay0;
            text = peach;
          };
          placeholder = {
            background = base;
            border = overlay0;
            childBorder = overlay0;
            indicator = overlay0;
            text = text;
          };
        };
      fonts = {
        names = [ "JetBrains Mono" ];
        size = 9.0;
      };
      gaps = {
        inner = 8;
        smartBorders = "on";
        smartGaps = true;
      };
      keybindings =
        let
          modifier = config.xsession.windowManager.i3.config.modifier;
        in
        lib.mkDefault {
          "${modifier}+Shift+Return" = "exec alacritty";
          "${modifier}+Shift+c" = "kill";
          "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
          "${modifier}+Shift+e" = "exec \"rofi -show power-menu -modi power-menu:rofi-power-menu\"";
          "${modifier}+Shift+s" = "exec --no-startup-id \"flameshot gui -c -s\"";
        };
      modes =
        {
          resize = {
            h = "resize shrink width 10 px or 10 ppt";
            j = "resize grow height 10 px or 10 ppt";
            k = "resize shrink height 10 px or 10 ppt";
            l = "resize grow width 10 px or 10 ppt";
            Escape = "mode default";
            Return = "mode default";
          };
        };
      modifier = "Mod4";
      startup = [
        { command = "systemctl --user restart polybar"; always = true; notification = false; }
        { command = "$HOME/.fehbg"; always = true; notification = false; }
        { command = "1password --silent"; always = false; notification = false; }
        { command = "blueman-applet"; always = false; notification = false; }
        { command = "clipit"; always = false; notification = false; }
        { command = "xsetroot -cursor_name left_ptr"; always = true; notification = false; }
      ];
    };
    extraConfig = ''
      set $mod Mod4
      bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%
      bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%
      bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle
      bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle
      bindsym XF86MonBrightnessUp exec sh ~/.config/i3/backlight.sh -inc 20
      bindsym XF86MonBrightnessDown exec sh ~/.config/i3/backlight.sh -dec 20
      bindsym --release $mod+Shift+f exec --no-startup-id flameshot gui -c

      # start dmenu (a program launcher)
      bindsym $mod+p exec --no-startup-id "rofi -modi window,run,ssh,drun -show-icons -show drun" 
      # -theme onedark"
      bindsym $mod+Tab exec --no-startup-id "rofi -modi window -show-icons -show window" 
      # -theme onedark"

      # change focus
      bindsym $mod+h focus left
      bindsym $mod+j focus down
      bindsym $mod+k focus up
      bindsym $mod+l focus right

      # move focused window
      bindsym $mod+Shift+h move left
      bindsym $mod+Shift+j move down
      bindsym $mod+Shift+k move up
      bindsym $mod+Shift+l move right

      # split in horizontal orientation
      bindsym $mod+b split h

      # split in vertical orientation
      bindsym $mod+v split v

      # enter fullscreen mode for the focused container
      bindsym $mod+f fullscreen toggle

      # change container layout (stacked, tabbed, toggle split)
      bindsym $mod+s layout stacking
      bindsym $mod+w layout tabbed
      bindsym $mod+e layout toggle split

      # toggle tiling / floating
      bindsym $mod+Shift+space floating toggle

      # change focus between tiling / floating windows
      bindsym $mod+space focus mode_toggle

      # focus the parent container
      bindsym $mod+a focus parent

      # focus the child container
      #bindsym $mod+d focus child

      # Define names for default workspaces for which we configure key bindings later on.
      # We use variables to avoid repeating the names in multiple places.
      set $ws1 "1"
      set $ws2 "2"
      set $ws3 "3"
      set $ws4 "4"
      set $ws5 "5"
      set $ws6 "6"
      set $ws7 "7"
      set $ws8 "8"
      set $ws9 "9"
      set $ws10 "10"

      # switch to workspace
      bindsym $mod+1 workspace number $ws1
      bindsym $mod+2 workspace number $ws2
      bindsym $mod+3 workspace number $ws3
      bindsym $mod+4 workspace number $ws4
      bindsym $mod+5 workspace number $ws5
      bindsym $mod+6 workspace number $ws6
      bindsym $mod+7 workspace number $ws7
      bindsym $mod+8 workspace number $ws8
      bindsym $mod+9 workspace number $ws9
      bindsym $mod+0 workspace number $ws10

      # move focused container to workspace
      bindsym $mod+Shift+1 move container to workspace number $ws1
      bindsym $mod+Shift+2 move container to workspace number $ws2
      bindsym $mod+Shift+3 move container to workspace number $ws3
      bindsym $mod+Shift+4 move container to workspace number $ws4
      bindsym $mod+Shift+5 move container to workspace number $ws5
      bindsym $mod+Shift+6 move container to workspace number $ws6
      bindsym $mod+Shift+7 move container to workspace number $ws7
      bindsym $mod+Shift+8 move container to workspace number $ws8
      bindsym $mod+Shift+9 move container to workspace number $ws9
      bindsym $mod+Shift+0 move container to workspace number $ws10

      # reload the configuration file
      bindsym $mod+Shift+q reload
      # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
      bindsym $mod+Shift+r restart

      bindsym $mod+r mode "resize"

      for_window [class="(?i)(?:1password)"] floating enable, focus
      for_window [class="(?i)(?Blueman-manager)"] floating enable, focus

      for_window [class=".*"] border pixel 2

      assign [class="Slack"] 4
      assign [class="Microsoft Teams"] 4
      assign [class="jetbrains-idea"] 3
      assign [class="zoom"] 9
      assign [class="Spotify"] 7
      assign [class="^firefox$"] 2
      assign [class="^thunderbird$"] 6
    '';
  };
}
