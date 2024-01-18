{ pkgs, lib, ... }: {
  programs.alacritty =
    let
      catpuccin-macchiato = pkgs.fetchurl {
        url = https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-macchiato.yml;
        hash = lib.fakeHash;
      };
    in
    {
      enable = true;
      settings = {
        import = [ catpuccin-macchiato ];
        font.normal.family = "JetBrains Mono";
        font.size = 10;
        env = {
          WINIT_X11_SCALE_FACTOR = "1.0";
        };
        window.padding = {
          x = 4;
          y = 4;
        };
        window.dynamic_padding = true;
        window.opacity = 0.95;
      };
    };
}
