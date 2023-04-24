{
  config = builtins.readFile ./config.vim;
  plugins = [ "monokai_nvim" ];
}
