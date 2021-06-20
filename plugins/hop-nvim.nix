{ pkgs, ... }: {
  # https://github.com/phaazon/hop.nvim
  # jump to any word, symbol or line with just a few keystrokes

  neovimRC = [
    ''
      " move to char
      map  <Leader>f :HopChar1<CR>
      nmap <Leader>f :HopChar1<CR>

      " move to word
      map  <Leader>w :HopWord<CR>
      nmap <Leader>w :HopWord<CR>

      " move to line
      map  <Leader>l :HopLine<CR>
      nmap <Leader>l :HopLine<CR>

      " required for default hint colors to be set up
      lua require'hop'.setup { }
    ''
  ];

  neovimPlugins = [ pkgs.vimPlugins.hop-nvim ];
}
