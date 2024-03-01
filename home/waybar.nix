{config, pkgs, ...}: {
  programs.waybar = {
    enable = true;
    # settings.mainBar = {
    #   layer = "top";
    #   position = "bottom";
    #   height = 20;
    #   spacing = 4;
    #   modules-left = [ "sway/workspaces" "sway/mode" "sway/scratchpad" "custom/media" ];
    #   modules-center = [ "sway/window" ];
    #   modules-right = [
    #     "mpd"
    #     "idle_inhibitor"
    #     "pulseaudio"
    #     "network"
    #     "cpu"
    #     "memory"
    #     "temperature"
    #     "backlight"
    #     "keyboard-state"
    #     "sway/language"
    #     "battery"
    #     "battery#bat2"
    #     "clock"
    #     "tray"
    #   ];
    # };
  };
}
