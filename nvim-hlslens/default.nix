# seamlessly jump between matched instances
{
  config = builtins.readFile ./config.vim;
  plugins = ["nvim-hlslens"];
}
