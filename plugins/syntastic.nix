{ pkgs, ... }: {
  # https://github.com/vim-syntastic/syntastic
  # runs files through external syntax checkers and displays resulting errors

  neovimRC = [
    ''
      " check syntax when opening files
      let g:syntastic_check_on_open = 1

      " do not check syntax when closing files
      let g:syntastic_check_on_wq = 0
    ''
  ];

  neovimPlugins = [ pkgs.vimPlugins.syntastic ];
}
