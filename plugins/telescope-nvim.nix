{ pkgs, ... }: {
  # https://github.com/nvim-telescope/telescope.nvim
  # highly extendable fuzzy finder over lists

  neovimRC = [
    ''
      " leader + o for fuzzy file opener dialog
      nnoremap <Leader>o <cmd>Telescope find_files<cr>
    ''
  ];

  neovimPlugins = [
    pkgs.vimPlugins.telescope-nvim
    pkgs.vimPlugins.popup-nvim
    pkgs.vimPlugins.plenary-nvim
  ];
}
