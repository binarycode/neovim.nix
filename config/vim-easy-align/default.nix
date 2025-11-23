{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.easy-align];

  extraConfigVim = builtins.readFile ./config.vim;
}
