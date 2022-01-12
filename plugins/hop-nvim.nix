{ pkgs, ... }: let
  hop-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "hop.nvim";
    version = "2022-01-12";
    src = pkgs.fetchFromGitHub {
      owner = "phaazon";
      repo = "hop.nvim";
      rev = "f418a3750ed3a7f321287a39d2c9a56d8ad630aa";
      sha256 = "2zwjqg6zzs0y7ki63brsxf2k64xv4nld8jrixw0naajn4pip43r3";
    };
  };
in {
  # https://github.com/phaazon/hop.nvim
  # jump to any word, symbol or line with just a few keystrokes

  my = {
    neovimRC = [
      ''
        " move to char
        map  <Leader>f :HopChar1<CR>
        nmap <Leader>f :HopChar1<CR>
        vmap <Leader>f <CMD>HopChar1<CR>

        " move to word
        map  <Leader>w :HopWord<CR>
        nmap <Leader>w :HopWord<CR>
        vmap <Leader>w <CMD>HopWord<CR>

        " move to line
        map  <Leader>l :HopLine<CR>
        nmap <Leader>l :HopLine<CR>
        vmap <Leader>l <CMD>HopLine<CR>

        " required for default hint colors to be set up
        lua require'hop'.setup { }
      ''
    ];
    neovimPlugins = [ hop-nvim ];

    neominRC = [
      ''
        " move to char
        map  <Leader>f :HopChar1<CR>
        nmap <Leader>f :HopChar1<CR>
        vmap <Leader>f <CMD>HopChar1<CR>

        " move to word
        map  <Leader>w :HopWord<CR>
        nmap <Leader>w :HopWord<CR>
        vmap <Leader>w <CMD>HopWord<CR>

        " move to line
        map  <Leader>l :HopLine<CR>
        nmap <Leader>l :HopLine<CR>
        vmap <Leader>l <CMD>HopLine<CR>

        " required for default hint colors to be set up
        lua require'hop'.setup { }
      ''
    ];
    neominPlugins = [ hop-nvim ];
  };
}
