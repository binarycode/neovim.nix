# search with ripgrep or silver searcher
{
  config = builtins.readFile ./config.vim;
  plugins = [ "vim-grepper" ];
}
