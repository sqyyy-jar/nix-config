{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    TERMINAL = "${config.programs.kitty.package}/bin/kitty";
  };

  programs.kitty = {
    enable = true;
    package = pkgs.unstable.kitty;
    font = {
      name = "Ubuntu Mono";
      size = 14;
    };
    settings = {
      hide_window_decorations = true;
      tab_bar_style = "slant";
      background = "#202020";
      background_opacity = "0.9";
      tab_title_max_length = 20;
      linux_display_server = "x11"; # https://github.com/NVIDIA/egl-wayland/issues/85
    };
    theme = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
  };
}
