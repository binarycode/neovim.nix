{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.ale];

  extraConfigVim = builtins.readFile ./config.vim;
}
