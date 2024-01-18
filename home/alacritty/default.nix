{ pkgs, lib, ... }: {
  programs.alacritty =
    let
      catpuccin-macchiato = pkgs.fetchurl {
        url = https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-macchiato.toml;
        hash = "sha256-m0Y8OBD9Pgjw9ARwjeD8a+JIQRDboVVCywQS8/ZBAcc=";
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
