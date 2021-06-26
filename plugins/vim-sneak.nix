{ pkgs, ... }: {
  # https://github.com/justinmk/vim-sneak
  # 2-char repeatable jumps
  # TODO: comma (jump back) is not working for some reason, why?

  my = {
    neovimPlugins = [ pkgs.vimPlugins.vim-sneak ];

    neominPlugins = [ pkgs.vimPlugins.vim-sneak ];
  };
}
