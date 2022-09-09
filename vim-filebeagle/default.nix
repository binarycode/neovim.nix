# file browser
{
  config = builtins.readFile ./config.vim;
  plugins = [ "vim-filebeagle" ];
}
