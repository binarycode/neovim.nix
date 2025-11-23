{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.vim-grepper];

  extraConfigVim = builtins.readFile ./config.vim;
}
