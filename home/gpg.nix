{pkgs, ...}: {
  programs.gpg = {
    enable = true;
  };

  home.packages = with pkgs; [
    # Tools for backing up keys.
    paperkey
    pgpdump
    cryptsetup

    # Securely accept passphrases.
    pinentry-qt
  ];

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    pinentryFlavor = "qt";
  };
}
