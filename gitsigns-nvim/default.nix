# git integration for buffers
{
  config = builtins.readFile ./config.vim;
  plugins = [ "gitsigns.nvim" ];
}
