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
          repo = "vim-kickstart";
          rev = "da484930941fcd1ff2215bc7d5f1568bef6fda7f";
          sha256 = "sha256-o3XSXSE0gzSgX6wyjwMPmNTGPnZJMRm2cnVEJtF6Gxs=";
        };
      })
    ];
  };
}
