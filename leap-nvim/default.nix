# general-purpose motion plugin
{
  config = builtins.readFile ./config.vim;
  plugins = [ "leap.nvim" ];
}

