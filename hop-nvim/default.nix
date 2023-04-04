# jump to any word, symbol or line with just a few keystrokes
{
  config = builtins.readFile ./config.vim;
  plugins = [ "hop_nvim" ];
}
