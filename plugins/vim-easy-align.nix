{ pkgs, ... }: {
  # https://github.com/junegunn/vim-easy-align
  # alignment shortcuts

  neovimRC = [
    ''
      " start in visual mode (e.g. vipga)
      xmap ga <Plug>(EasyAlign)

      " start for motion/text object (e.g. gaip)
      nmap ga <Plug>(EasyAlign)
    ''
  ];

  neovimPlugins = [ pkgs.vimPlugins.vim-easy-align ];
}
