# change working directory to project root
{
  config = builtins.readFile ./config.vim;
  plugins = [ "vim-rooter" ];
}
