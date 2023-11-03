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
      background_image = "~/Pictures/uwp984724.png";
      # background_image = "~/Pictures/wp7629134.png";
      background_image_layout = "scaled";
      # background_tint = "0.2";
    };
    theme = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
  };
}
