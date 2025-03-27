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
      # name = "Iosevka";
      name = "Hack Nerd Font";
      size = 14.5;
    };
    settings = {
      hide_window_decorations = true;
      tab_bar_style = "slant";
      # background = "#202020";
      background_opacity = "0.9";
      tab_title_max_length = 20;
      linux_display_server = "x11";
      enabled_layouts = "splits";
    };
    keybindings = {
      "f4" = "launch --location=split";
      "f5" = "launch --location=hsplit";
      "f6" = "launch --location=vsplit";
      "ctrl+left" = "resize_window narrower 2";
      "ctrl+right" = "resize_window wider 2";
      "ctrl+up" = "resize_window taller 2";
      "ctrl+down" = "resize_window shorter 2";
    };
    # theme = "Adwaita dark";
    shellIntegration.enableZshIntegration = true;
  };
}
