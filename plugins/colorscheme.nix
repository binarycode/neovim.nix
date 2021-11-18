{ pkgs, ... }: {
  my = {
    neovimRC = [
      ''
        if has('termguicolors')
          set termguicolors
        endif

        colorscheme molokai
      ''
    ];

    neovimPlugins = [
      pkgs.vimPlugins.molokai # https://github.com/tomasr/molokai

      pkgs.vimPlugins.neon # https://github.com/rafamadriz/neon
      pkgs.vimPlugins.vim-code-dark # https://github.com/tomasiser/vim-code-dark
      pkgs.vimPlugins.nvcode-color-schemes-vim # https://github.com/ChristianChiarulli/nvcode-color-schemes.vim
      pkgs.vimPlugins.edge # https://github.com/sainnhe/edge
      pkgs.vimPlugins.vim-deus # https://github.com/theniceboy/nvim-deus
      pkgs.vimPlugins.one-nvim # https://github.com/Th3Whit3Wolf/one-nvim
      pkgs.vimPlugins.aurora # https://github.com/ray-x/aurora
      pkgs.vimPlugins.vim-monokai # https://github.com/tanvirtin/monokai.nvim
      pkgs.vimPlugins.vim-monokai-pro
      pkgs.vimPlugins.nvim-base16 # https://github.com/RRethy/nvim-base16
      pkgs.vimPlugins.falcon # https://github.com/fenetikm/falcon
      pkgs.vimPlugins.nord-nvim # https://github.com/shaunsingh/nord.nvim
      pkgs.vimPlugins.nvim-solarized-lua # https://github.com/ishan9299/nvim-solarized-lua
      pkgs.vimPlugins.moonlight-nvim # https://github.com/shaunsingh/moonlight.nvim
      pkgs.vimPlugins.onedark-vim
      pkgs.vimPlugins.onedarkpro-nvim # https://github.com/olimorris/onedarkpro.nvim
      pkgs.vimPlugins.gruvbox-material # https://github.com/sainnhe/gruvbox-material
      pkgs.vimPlugins.dracula-vim # https://github.com/dracula/vim
      pkgs.vimPlugins.nightfox-nvim # https://github.com/FrenzyExists/aquarium-vim
      pkgs.vimPlugins.oceanic-next # https://github.com/mhartington/oceanic-next
      pkgs.vimPlugins.sonokai # https://github.com/sainnhe/sonokai
      pkgs.vimPlugins.tokyonight-nvim # https://github.com/folke/tokyonight.nvim
    ];
  };
}
