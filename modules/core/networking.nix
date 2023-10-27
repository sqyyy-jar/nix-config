{...}: {
  networking = {
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
      ethernet.macAddress = "random";
    };

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];

    extraHosts = ''
      127.0.0.0 doubleclick.net
      127.0.0.0 googleads.g.doubleclick.net
      127.0.0.0 static.doubleclick.net
    '';
  };
}
