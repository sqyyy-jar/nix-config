{ lib, pkgs, config, ... }:
let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;
in
{
  services.forgejo = {
    enable = true;
    database.type = "postgres";
    lfs.enable = false;
    settings = {
      # server.HTTP_ADDR = "0.0.0.0";
    };
  };

  networking.firewall.allowedTCPPorts = [ 3000 ];
}
