{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [ git-credential-keepassxc ];
  programs.git = {
    enable = true;
    package = pkgs.unstable.gitAndTools.gitFull;

    userName = "sqyyy-jar";
    userEmail = "62748369+sqyyy-jar@users.noreply.github.com";

    signing = {
      key = "0B1D5B8CF5E9603C";
      signByDefault = true;
    };

    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      # credential."https://github.com".helper = "gh auth git-credential";
      credential."https://github.com".helper = "keepassxc --git-groups";
    };

    lfs.enable = true;

    aliases = {
      st = "status";
      co = "checkout";
      lp = "log -p";
      p = "push";
      c = "commit";
      a = "add";
    };
  };
}
