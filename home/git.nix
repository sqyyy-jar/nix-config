{
  pkgs,
  ...
}: {
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
      core.editor = "nvim";
      pull.rebase = true;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
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
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
    };
  };
}
