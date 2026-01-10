{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
