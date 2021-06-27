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
          owner = "tobiwild";
          repo = "vim-filebeagle";
          rev = "2b9ab186c486c98896bc3fb178867b6603d75fb1";
          sha256 = "1pw9qwcs69ff4cmgmjjflh2vprp6kz7whs3x7xhhi476mi7bzh49";
        };
      })
    ];
  };
}
