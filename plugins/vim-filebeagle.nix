{ pkgs, ... }: {
  # https://github.com/jeetsukumaran/vim-filebeagle
  # file browser

  my = {
    neovimRC = [
      ''
        " show hidden files
        let g:filebeagle_show_hidden=1

        " disable default keymappings
        let g:filebeagle_suppress_keymaps = 1

        " open filebeagle
        map <silent>- <Plug>FileBeagleOpenCurrentBufferDir
      ''
    ];
    neovimPlugins = [
      (pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = "vim-filebeagle";
        version = "2018-01-04";
        src = pkgs.fetchFromGitHub {
          owner = "jeetsukumaran";
          repo = "vim-filebeagle";
          rev = "9c05886116975ada616df4b70be0482bd6c44d77";
          sha256 = "eNKN7j5RJASDOZyjIrtVmGncuM0gxrE60WnKu7ELcpc=";
        };
      })
    ];
  };
}
