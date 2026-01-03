{
  plugins = {
    telescope = {
      enable = true;
      lazyLoad.settings.lazy = true;
      keymaps = {
        "<Leader>gr" = "live_grep";
        "<Leader>o" = "find_files";
      };
    };
    web-devicons.enable = false;
  };

  extraConfigLua = builtins.readFile ./config.lua;
}
