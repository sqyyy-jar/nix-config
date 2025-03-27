{
  config,
  pkgs,
  ...
}: let
  zshPlugin = src: rec {
    inherit src;
    name = src.pname;
    file = "share/${name}/${name}.zsh";
  };
in {
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    autocd = true;
    dotDir = ".config/zsh";

    shellAliases = {
      ls = "eza";
      cat = "bat";
      diff = "diff --color=auto";
      cdd = "cd /mnt/data";

      rebuild = "sudo nixos-rebuild switch";
    };

    history = {
      path = "${config.xdg.dataHome}/zsh/zshHistory";
      extended = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "lambda"; # imajes, lambda, sammy
    };

    plugins = with pkgs; [
      (zshPlugin zsh-syntax-highlighting)
      (zshPlugin zsh-history-substring-search)
    ];

    envExtra = ''
      export GPG_TTY="$(tty)"

      export ZSH_CACHE_DIR="$HOME/.cache/zsh"
      mkdir -p $ZSH_CACHE_DIR/completions
    '';
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;

    nix-direnv.enable = true;
    config = {
      global = {
        disable_stdin = true;
        warn_timeout = "5m";
      };
    };
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.nix-index-database.comma.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
