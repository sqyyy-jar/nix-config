{...}: {
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];

    # extraHosts = let
    #   hostsPath = "https://raw.githubusercontent.com/StevenBlack/hosts/218bd9ec4811d2fd48ee7c3879c6459bdfc76890/alternates/fakenews-gambling-porn/hosts";
    #   hostsFile = builtins.fetchurl {
    #     url = hostsPath;
    #     sha256 = "1j02gfm7pcgdviglg1qs74r7dygc297709wlig76nffq4zjy91ak";
    #   };
    # in builtins.readFile "${hostsFile}";
  };
}
