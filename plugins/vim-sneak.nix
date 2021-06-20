{ pkgs, ... }: {
  # https://github.com/justinmk/vim-sneak
  # 2-char repeatable jumps
  # TODO: comma (jump back) is not working for some reason, why?

  neovimPlugins = [ pkgs.vimPlugins.vim-sneak ];
}
