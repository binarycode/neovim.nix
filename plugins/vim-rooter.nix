{ pkgs, ... }: {
  # https://github.com/airblade/vim-rooter
  # change working directory to project root

  my = {
    neovimRC = [
      ''
        " execute :Rooter to change root
        let g:rooter_manual_only = 1

        " change root for current window only
        let g:rooter_cd_cmd="lcd"
      ''
    ];
    neovimPlugins = [ pkgs.vimPlugins.vim-rooter ];
  };
}
