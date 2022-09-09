# highly extendable fuzzy finder over lists
{
  config = builtins.readFile ./config.vim;
  plugins = [
    "plenary.nvim"
    "popup.nvim"
    "telescope.nvim"
  ];
}
