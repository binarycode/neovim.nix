# highly extendable fuzzy finder over lists
{
  config = builtins.readFile ./config.vim;
  plugins = [
    "plenary_nvim"
    "popup_nvim"
    "telescope_nvim"
  ];
}
