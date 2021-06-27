{ pkgs, ... }: {
  # https://github.com/ggandor/lightspeed.nvim
  # quick and efficient on-screen navigation

  my = {
    neovimPlugins = [ pkgs.vimPlugins.lightspeed-nvim ];

    neominPlugins = [ pkgs.vimPlugins.lightspeed-nvim ];
  };
}
