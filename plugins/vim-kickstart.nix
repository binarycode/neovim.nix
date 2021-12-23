{ pkgs, ... }: {
  # https://github.com/tangledhelix/vim-kickstart
  # Syntax highlighting for RedHat Linux kickstart configuration files

  my = {
    neovimPlugins = [
      (pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = "vim-kickstart";
        version = "2018-03-29";
        src = pkgs.fetchFromGitHub {
          owner = "tangledhelix";
          repo = "kickstart.vim";
          rev = "da484930941fcd1ff2215bc7d5f1568bef6fda7f";
          sha256 = "11q9zyz6lr3kycgw2kg6ih2ldaiap5im7rrc85pi6ffdmhm849s5";
        };
      })
    ];
  };
}
