# Asynchronous Lint Engine
{
  config = builtins.readFile ./config.vim;
  plugins = [ "ale" ];
}
