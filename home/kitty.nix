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
      # ...
      background_image = "~/Pictures/terminal-wallpapers/clean1.png";
      background_image_layout = "scaled";
      background_tint = "0.9";
    };
    theme = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
  };
}
