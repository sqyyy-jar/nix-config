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
      name = "Cascadia Code";
      size = 14;
    };
    settings = {
      hide_window_decorations = true;
      tab_bar_style = "slant";
      background = "#251f31";
    };
    theme = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
  };
}
