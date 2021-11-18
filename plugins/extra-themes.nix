{ pkgs, ... }: {
  my = {
    neovimPlugins = [
      pkgs.vimPlugins.dracula-vim # https://github.com/dracula/vim
      pkgs.vimPlugins.gruvbox-material # https://github.com/sainnhe/gruvbox-material
      pkgs.vimPlugins.oceanic-next # https://github.com/mhartington/oceanic-next
      pkgs.vimPlugins.sonokai # https://github.com/sainnhe/sonokai
      pkgs.vimPlugins.tokyonight-nvim # https://github.com/folke/tokyonight.nvim
    ];
  };
}
